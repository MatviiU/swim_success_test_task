import 'package:flutter/material.dart';
import 'package:swim_success/core/constants/app_constants.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: AppStringsConstants.searchByUserName,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
