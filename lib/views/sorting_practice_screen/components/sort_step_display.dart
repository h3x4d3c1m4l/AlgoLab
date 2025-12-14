import 'package:algolab/extensions/build_context_extension.dart';
import 'package:algolab/models/sort_step_view_model.dart';
import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

class SortStepDisplay extends StatefulWidget {

  final String? leading;
  final SortStepViewModel viewModel;
  final ScrollController buttonsScrollController;
  final ValueChanged<ISet<int>> onSelectedIndicesChanged;

  const SortStepDisplay({super.key, required this.leading, required this.viewModel, required this.buttonsScrollController, required this.onSelectedIndicesChanged});

  @override
  State<SortStepDisplay> createState() => _SortStepDisplayState();

}

class _SortStepDisplayState extends State<SortStepDisplay> {

  bool _isScreenSizeJustChanged = false;
  bool? _isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          onConstraintsChanged(context.isMobile);

          Widget? startText = widget.leading != null ? Text(
            widget.leading!,
            textAlign: TextAlign.end,
            style: widget.viewModel.type == SortStepType.endResult
                ? TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(),
          ) : null;

          Widget buttons = _SortStepButtons(
            viewModel: widget.viewModel,
            buttonsScrollController: !_isScreenSizeJustChanged ? widget.buttonsScrollController : null,
            onSelectedIndicesChanged: widget.onSelectedIndicesChanged,
          );

          if (context.isMobile) {
            // Phone, ...
            return Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [if (startText != null) Padding(padding: EdgeInsets.only(left: 16), child: startText), buttons],
            );
          } else {
            // Tablet, laptop, desktop, ...
            return Row(
              spacing: 16,
              children: [
                SizedBox(width: 128, child: startText),
                Expanded(child: Center(child: buttons)),
                SizedBox(width: 128),
              ],
            );
          }
        },
      ),
    );
  }

  void onConstraintsChanged(bool screenBreakpointIsSmall) {
    if (_isMobile != screenBreakpointIsSmall) {
      // Temporarily remove scroll containers on buttons to avoid exceptions in `linked_scroll_controller`.
      _isScreenSizeJustChanged = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _isScreenSizeJustChanged = false);
      });
      _isMobile = screenBreakpointIsSmall;
    }
  }

}

class _SortStepButtons extends StatelessWidget {

  final SortStepViewModel viewModel;
  final ScrollController? buttonsScrollController;
  final ValueChanged<ISet<int>> onSelectedIndicesChanged;

  const _SortStepButtons({
    required this.viewModel,
    required this.buttonsScrollController,
    required this.onSelectedIndicesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollShadow(
      child: SingleChildScrollView(
        key: ObjectKey(buttonsScrollController),
        scrollDirection: Axis.horizontal,
        controller: buttonsScrollController,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SegmentedButton(
          segments: viewModel.currentValues.mapIndexed((index, element) {
            return ButtonSegment(value: index, label: Text('$element'));
          }).toList(),
          selected: viewModel.highlightedIndices.unlockView,
          multiSelectionEnabled: true,
          emptySelectionAllowed: true,
          style: SegmentedButton.styleFrom(
            selectedBackgroundColor: viewModel.type == SortStepType.correctSwap || viewModel.type == SortStepType.compare
                ? Colors.lightGreenAccent
                : viewModel.type == SortStepType.incorrectSwap
                ? Colors.red
                : Colors.yellow,
            backgroundColor: Colors.white,
          ),
          showSelectedIcon: false,
          onSelectionChanged: (indicesSet) {
            if (viewModel.type == null) onSelectedIndicesChanged(indicesSet.lock);
          },
        ),
      ),
    );
  }

}
