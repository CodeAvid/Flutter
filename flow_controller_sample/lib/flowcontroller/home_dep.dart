import 'package:flutter/widgets.dart';

abstract class OnHomeListener<T extends StatefulWidget> implements State<T> {
  void onHomeClicked() {}
}
