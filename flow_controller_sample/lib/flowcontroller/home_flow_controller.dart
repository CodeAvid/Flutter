import 'package:flow_controller_sample/base/flow_controller.dart';
import 'package:flow_controller_sample/screen/home_screen.dart';
import 'package:flutter/material.dart';

class HomeFlowController extends StatefulWidget {
  @override
  _HomeFlowControllerState createState() => _HomeFlowControllerState();
}

class _HomeFlowControllerState extends FlowControllerState<HomeFlowController> {
  @override
  AppPage createInitialPage() => AppPage(HomeScreenRoute, HomeScreen());

  static const String HomeScreenRoute = "home";
}
