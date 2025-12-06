import 'package:algolab/app_router.gr.dart';
import 'package:algolab/extensions/build_context_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CancelExerciseDialog extends StatelessWidget {

  const CancelExerciseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Cancel exercise"),
      content: Text("Are you sure you want to cancel the ongoing exercise? Any progress will not be saved."),
      iconColor: context.theme.colorScheme.error,
      actions: [
        TextButton.icon(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_forward_ios),
          label: Text("Continue"),
        ),
        ElevatedButton.icon(
          onPressed: () => context.replaceRoute(DashboardRoute()),
          style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
          icon: Icon(Icons.close),
          label: Text('Cancel exercise'),
        ),
      ],
    );
  }

}
