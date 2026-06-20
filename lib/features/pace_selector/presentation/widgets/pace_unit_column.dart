import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaceUnitColumn extends StatefulWidget {
  const PaceUnitColumn({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    required this.onSubmitted,
    this.twoDigits = true,
  });

  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final ValueChanged<int> onSubmitted;
  final bool twoDigits;

  @override
  State<PaceUnitColumn> createState() => _PaceUnitColumnState();
}

class _PaceUnitColumnState extends State<PaceUnitColumn> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  var _isEditing = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: widget.onIncrement,
          icon: const Icon(Icons.keyboard_arrow_up),
          iconSize: 32,
        ),
        SizedBox(
          width: 96,
          child: _isEditing
              ? TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: theme.textTheme.displayLarge,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onSubmitted: (_) => _commit(),
                )
              : GestureDetector(
                  onTap: _startEditing,
                  child: Text(
                    _displayValue,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayLarge,
                  ),
                ),
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 32,
          onPressed: widget.onDecrement,
        ),
      ],
    );
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) _commit();
  }

  void _startEditing() {
    _controller.text = widget.value.toString();
    _controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _controller.text.length,
    );

    setState(() {
      _isEditing = true;
    });

    _focusNode.requestFocus();
  }

  void _commit() {
    if (!_isEditing) return;
    final parsed = int.tryParse(_controller.text);

    setState(() {
      _isEditing = false;
    });

    if (parsed != null) {
      widget.onSubmitted(parsed);
    }
  }

  String get _displayValue => widget.twoDigits
      ? widget.value.toString().padLeft(2, '0')
      : widget.value.toString();
}
