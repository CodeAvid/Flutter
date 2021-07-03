import 'package:flow_controller_sample/base/flow_controller.dart';
import 'package:flow_controller_sample/screen/sign_up_screen.dart';
import 'package:flow_controller_sample/widget/design.dart';

import 'landing_dep.dart';
import 'login_flow_controller.dart';

class SignUpFlowController extends StatefulWidget {
  @override
  _SignUpFlowControllerState createState() => _SignUpFlowControllerState();
}

class _SignUpFlowControllerState
    extends FlowControllerState<SignUpFlowController>
    implements OnLoggedInListener<SignUpFlowController> {
  @override
  AppPage createInitialPage() => AppPage(_SIGN_UP_PAGE, SignUpScreen());

  @override
  void onLogInClicked() {
    pushSimple(() => LoginFlowController(), _LoginRoute);
  }

  static const String _SIGN_UP_PAGE = "signup";
  static const String _LoginRoute = "login";
}
