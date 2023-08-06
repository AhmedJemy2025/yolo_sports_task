import 'package:art_core/art_core.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';

class ErrorView  extends StatelessWidget {

  final Function onRetryClick;
  final String? errorMessage;

  const ErrorView({Key? key, required this.onRetryClick, this.errorMessage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(text: errorMessage ?? "Something went wrong" , color: colorBlack , fontSize: 8,),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              onRetryClick();
            },
            child: Icon(Icons.refresh, color: colorGrey, size: 35,)
          ),
        ],
      ),
    );
  }
}


