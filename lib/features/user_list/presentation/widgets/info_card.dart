import 'package:flutter/material.dart';
import 'package:swim_success/features/user_list/presentation/widgets/info_tile.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.tiles});

  final List<InfoTile> tiles;

  @override
  Widget build(BuildContext context) {
    final visible = tiles.where((tile) => tile.value.isNotEmpty).toList();
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        child: Column(
          children: [
            for (var i = 0; i < visible.length; i++) ...[
              visible[i],
              if (i != visible.length - 1) const Divider(height: 1, indent: 56),
            ],
          ],
        ),
      ),
    );
  }
}
