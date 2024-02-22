import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static errorDialog(context,
      {required String title,
      required String text,
      String buttonTxt = "OK",
      VoidCallback? buttonPress}) {
    

    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColorDark),
      descTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColorDark),
      dialogBackgroundColor: Theme.of(context).colorScheme.background,
      title: title,
      desc: text,
      btnOkText: buttonTxt,
      btnOkOnPress: (){
        if(buttonPress!=null){
          buttonPress();
        }
      },
    ).show();
  }
  static successDialog(context,
      {required String title,
      required String text,
      String buttonTxt = "OK",
      VoidCallback? buttonPress}) {
    

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      dialogBackgroundColor: Theme.of(context).primaryColorDark,
      title: title,
      desc: text,
      btnOkText: buttonTxt,
      btnOkOnPress: (){
        if(buttonPress!=null){
          buttonPress();
        }
      },
    ).show();
  }
}
