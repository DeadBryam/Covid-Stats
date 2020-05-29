import 'package:flutter/material.dart';

void toRoute(
    {@required BuildContext context,
    @required String path,
    dynamic arguments}) {
  Navigator.pushNamed(context, path, arguments: arguments);
}
