import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyCustomFooter extends StatelessWidget {
  const MyCustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClassicFooter(
      loadingIcon: CupertinoActivityIndicator(
        color: Colors.white,
      ),
      canLoadingIcon: Icon(
        Icons.autorenew,
        color: Colors.white,
      ),
      idleIcon: Icon(
        Icons.arrow_upward,
        color: Colors.white,
      ),
      textStyle: TextStyle(color: Colors.white),
    );
  }
}
