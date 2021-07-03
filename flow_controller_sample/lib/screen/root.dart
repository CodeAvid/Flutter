import 'package:flow_controller_sample/base/pop_scope.dart';
import 'package:flow_controller_sample/flowcontroller/sign_up_flow_controller.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with PopScopeHost<RootPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SignUpFlowController(),
      ),
    );
  }
}
