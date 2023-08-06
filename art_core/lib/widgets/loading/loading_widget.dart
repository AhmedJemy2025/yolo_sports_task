import 'package:flutter/cupertino.dart';

import '../../theme/styles.dart';


class AppLoading extends StatelessWidget {
  final Color? color;

  const AppLoading({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CupertinoActivityIndicator(color: color ?? colorGrey , radius: 20,));
  }
}
