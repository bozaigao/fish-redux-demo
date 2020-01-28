import 'package:flutter/material.dart';

/// 保持状态的包裹类
class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const KeepAliveWidget({this.child});

  @override
  State<StatefulWidget> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget keepAliveWrapper(Widget child) => KeepAliveWidget(child: child,);
