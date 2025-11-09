import 'package:algolab/views/base/build_context_accessor.dart';
import 'package:algolab/views/base/screen_base.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_controller.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_view.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_view_model.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class DashboardScreen extends ScreenBase<DashboardScreenViewModel, DashboardScreenController, DashboardScreenView> {

  const DashboardScreen({super.key});

  @override
  DashboardScreenController createController({required DashboardScreenViewModel viewModel, required BuildContextAccessor contextAccessor}) {
    return DashboardScreenController(viewModel: viewModel, contextAccessor: contextAccessor);
  }

  @override
  DashboardScreenView createView({required DashboardScreenController controller, required DashboardScreenViewModel viewModel, required BuildContextAccessor contextAccessor}) {
    return DashboardScreenView(viewModel: viewModel, controller: controller, contextAccessor: contextAccessor);
  }

  @override
  DashboardScreenViewModel createViewModel({required BuildContextAccessor contextAccessor}) {
    return DashboardScreenViewModel(contextAccessor: contextAccessor);
  }

}
