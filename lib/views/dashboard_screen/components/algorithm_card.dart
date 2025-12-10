import 'package:algolab/algorithms/algorithm.dart';
import 'package:algolab/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class AlgorithmCard extends StatelessWidget {

  final Algorithm algorithm;
  final VoidCallback onTap;

  const AlgorithmCard({super.key, required this.algorithm, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 32, 24),
          width: 350,
          child: Column(
            children: [
              Row(
                spacing: 16,
                children: [
                  Icon(algorithm.icon, size: 96, color: context.theme.colorScheme.primary),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(algorithm.name, style: context.theme.textTheme.titleLarge),
                        Text(algorithm.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
