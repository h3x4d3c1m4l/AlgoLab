import 'package:algolab/views/base/screen_view_base.dart';
import 'package:algolab/views/components/algo_lab_scaffold.dart';
import 'package:algolab/views/debug_screen/debug_screen_controller.dart';
import 'package:algolab/views/debug_screen/debug_screen_view_model.dart';
import 'package:flutter/material.dart';

class DebugScreenView extends ScreenViewBase<DebugScreenViewModel, DebugScreenController> {

  const DebugScreenView({
    required super.viewModel,
    required super.controller,
    required super.contextAccessor,
  });

  @override
  Widget get body {
    TextTheme defaultTheme = Typography.englishLike2021;
    return AlgoLabScaffold(
      appBarMiddle: Text("Text styles"),
      body: ListView(
        children: [
          Row(children: [
            Expanded(child: Text("Display Large", style: defaultTheme.displayLarge)),
            Expanded(child: Text("Display Large", style: theme.textTheme.displayLarge)),
          ]),
          Row(children: [
            Expanded(child: Text("Display Medium", style: defaultTheme.displayMedium)),
            Expanded(child: Text("Display Medium", style: theme.textTheme.displayMedium)),
          ]),
          Row(children: [
            Expanded(child: Text("Display Small", style: defaultTheme.displaySmall)),
            Expanded(child: Text("Display Small", style: theme.textTheme.displaySmall)),
          ]),
          Row(children: [
            Expanded(child: Text("Headline Large", style: defaultTheme.headlineLarge)),
            Expanded(child: Text("Headline Large", style: theme.textTheme.headlineLarge)),
          ]),
          Row(children: [
            Expanded(child: Text("Headline Medium", style: defaultTheme.headlineMedium)),
            Expanded(child: Text("Headline Medium", style: theme.textTheme.headlineMedium)),
          ]),
          Row(children: [
            Expanded(child: Text("Headline Small", style: defaultTheme.headlineSmall)),
            Expanded(child: Text("Headline Small", style: theme.textTheme.headlineSmall)),
          ]),
          Row(children: [
            Expanded(child: Text("Title Large", style: defaultTheme.titleLarge)),
            Expanded(child: Text("Title Large", style: theme.textTheme.titleLarge)),
          ]),
          Row(children: [
            Expanded(child: Text("Title Medium", style: defaultTheme.titleMedium)),
            Expanded(child: Text("Title Medium", style: theme.textTheme.titleMedium)),
          ]),
          Row(children: [
            Expanded(child: Text("Title Small", style: defaultTheme.titleSmall)),
            Expanded(child: Text("Title Small", style: theme.textTheme.titleSmall)),
          ]),
          Row(children: [
            Expanded(child: Text("Body Large", style: defaultTheme.bodyLarge)),
            Expanded(child: Text("Body Large", style: theme.textTheme.bodyLarge)),
          ]),
          Row(children: [
            Expanded(child: Text("Body Medium", style: defaultTheme.bodyMedium)),
            Expanded(child: Text("Body Medium", style: theme.textTheme.bodyMedium)),
          ]),
          Row(children: [
            Expanded(child: Text("Body Small", style: defaultTheme.bodySmall)),
            Expanded(child: Text("Body Small", style: theme.textTheme.bodySmall)),
          ]),
          Row(children: [
            Expanded(child: Text("Label Large", style: defaultTheme.labelLarge)),
            Expanded(child: Text("Label Large", style: theme.textTheme.labelLarge)),
          ]),
          Row(children: [
            Expanded(child: Text("Label Medium", style: defaultTheme.labelMedium)),
            Expanded(child: Text("Label Medium", style: theme.textTheme.labelMedium)),
          ]),
          Row(children: [
            Expanded(child: Text("Label Small", style: defaultTheme.labelSmall)),
            Expanded(child: Text("Label Small", style: theme.textTheme.labelSmall)),
          ]),
        ],
      ),
    );
  }

}
