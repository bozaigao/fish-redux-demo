import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/state_layout.dart';

class WidgetNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: "页面不存在",
      ),
      body: Text("页面不存在"),
    );
  }
}
