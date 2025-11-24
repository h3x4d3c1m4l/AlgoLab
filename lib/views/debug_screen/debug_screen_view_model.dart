import 'package:algolab/views/base/screen_view_model_base.dart';
import 'package:mobx/mobx.dart';

part 'debug_screen_view_model.g.dart';

class DebugScreenViewModel = DebugScreenViewModelBase with _$DebugScreenViewModel;

abstract class DebugScreenViewModelBase extends ScreenViewModelBase with Store {

  DebugScreenViewModelBase({
    required super.contextAccessor,
  });

}
