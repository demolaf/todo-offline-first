import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    required this.selected,
    required this.title,
    super.key,
  });

  final bool selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: selected
          ? BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(24),
            )
          : null,
      child: Text(
        title,
      ),
    );
  }
}
