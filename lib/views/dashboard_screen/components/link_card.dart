import 'package:algolab/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final String description;
  final String externalUrl;

  const LinkCard({super.key, required this.icon, required this.title, required this.description, required this.externalUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => launchUrlString(externalUrl),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 32, 24),
          width: 350,
          child: Row(
            spacing: 16,
            children: [
              Icon(icon, size: 96, color: context.theme.colorScheme.primary),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(title, style: context.theme.textTheme.titleLarge),
                    Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
                    Text(
                      externalUrl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.theme.textTheme.labelSmall!.copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
