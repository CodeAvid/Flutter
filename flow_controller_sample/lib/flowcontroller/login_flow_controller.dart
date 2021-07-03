import 'package:flow_controller_sample/base/flow_controller.dart';
import 'package:flow_controller_sample/flowcontroller/sign_up_flow_controller.dart';
import 'package:flow_controller_sample/screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'landing_dep.dart';

class LoginFlowController extends StatefulWidget {
  @override
  _LoginFlowControllerState createState() => _LoginFlowControllerState();
}

class _LoginFlowControllerState extends FlowControllerState<LoginFlowController>
    implements OnSignUpListener<LoginFlowController> {
  @override
  AppPage createInitialPage() => AppPage(_LoginRoute, LoginScreen());

  @override
  void onSignUpClicked() {
    pushSimple(() => SignUpFlowController(), _SignUpRoute);
  }

  static const _SignUpRoute = "signup";

  static const _LoginRoute = "login";
}
