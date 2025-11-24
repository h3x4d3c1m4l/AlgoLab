import 'package:algolab/views/base/build_context_accessor.dart';
import 'package:algolab/views/base/screen_base.dart';
import 'package:algolab/views/debug_screen/debug_screen_controller.dart';
import 'package:algolab/views/debug_screen/debug_screen_view.dart';
import 'package:algolab/views/debug_screen/debug_screen_view_model.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class DebugScreen extends ScreenBase<DebugScreenViewModel, DebugScreenController, DebugScreenView> {

  const DebugScreen({super.key});

  @override
  DebugScreenController createController({required DebugScreenViewModel viewModel, required BuildContextAccessor contextAccessor}) {
    return DebugScreenController(viewModel: viewModel, contextAccessor: contextAccessor);
  }

  @override
  DebugScreenView createView({required DebugScreenController controller, required DebugScreenViewModel viewModel, required BuildContextAccessor contextAccessor}) {
    return DebugScreenView(viewModel: viewModel, controller: controller, contextAccessor: contextAccessor);
  }

  @override
  DebugScreenViewModel createViewModel({required BuildContextAccessor contextAccessor}) {
    return DebugScreenViewModel(contextAccessor: contextAccessor);
  }

}
