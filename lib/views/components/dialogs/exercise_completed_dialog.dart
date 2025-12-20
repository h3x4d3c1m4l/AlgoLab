import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ExerciseCompletedDialog extends StatelessWidget {

  const ExerciseCompletedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Exercise completed"),
      content: Text("You have successfully completed the exercise!\n\nWould you like to practise again with a new set of numbers, take a longer look at the steps you have taken or go back to the main menu?"),
      actions: [
        TextButton.icon(
          onPressed: () {
          },
          icon: Icon(Icons.replay),
          label: Text('Practise again'),
        ),
        TextButton.icon(
          onPressed: () => context.pop(),
          icon: Icon(Icons.visibility),
          label: Text('View steps'),
        ),
        FilledButton.icon(
          onPressed: () => context..pop()..pop(),
          icon: Icon(Icons.home),
          label: Text('Go home'),
        ),
      ],
    );
  }

}
