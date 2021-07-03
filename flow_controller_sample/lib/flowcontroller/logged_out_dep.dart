import 'package:flutter/material.dart';

abstract class LoggedOutFlowListener<T extends StatefulWidget>
    implements State<T> {
  void onLoggedIn();
}
