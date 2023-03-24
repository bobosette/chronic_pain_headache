//perfect custom loading dialog
import 'package:chronic_pain_headache/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog(
      {Key? key,})
      : super(key: key);

 

  @override
  LoadingDialogState createState() {
    return LoadingDialogState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class LoadingDialogState extends State<LoadingDialog> {
  void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: true,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(12.0),
              child:const SpinKitFadingCircle(color: buttonColor)),
        ),
      ),
    );
  }
}