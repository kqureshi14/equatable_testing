import 'package:injectable/injectable.dart';

import 'package:equatable_testing/services/services.dart';
import 'package:equatable_testing/base/base_viewmodel.dart';
import 'package:equatable_testing/base/screen_layout_base/screen_layout_base_m.dart';

@injectable
class ScreenLayoutBaseViewModel extends BaseViewModel<ScreenLayoutBaseState> {
  ScreenLayoutBaseViewModel({
    required ApplicationService appService,
    required INavigationService navigationService,
  })  : _appService = appService,
        _navigationService = navigationService,
        super(const Initialized());

  final ApplicationService _appService;
  final INavigationService _navigationService;

  void logout() async {
    _appService.logout();
  }

  void backTo() => _navigationService.pop();

  bool? getSearchVisiblity() => _appService.state.searchVisible;
}
