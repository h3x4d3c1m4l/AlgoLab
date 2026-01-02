import 'package:algolab/extensions/build_context_extension.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {

  final IconData icon;
  final String title;
  final List<Widget> bodyCards;

  const DashboardSection({
    super.key,
    required this.icon,
    required this.title,
    required this.bodyCards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          spacing: 16,
          children: [
            Icon(icon),
            Text(title, style: context.theme.textTheme.headlineMedium),
          ],
        ),
        FlexibleWrap(
          spacing: 8,
          runSpacing: 16,
          children: bodyCards,
        ),
      ],
    );
  }

}
