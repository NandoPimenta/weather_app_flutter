
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingDialog {

  static show({status = "Carregando..."}){
    EasyLoading.show(status: status);
  }
  static dismiss({String status = "Carregando..."}){
    EasyLoading.dismiss();
  }
  static showToast({required String message}){
    EasyLoading.showToast(message);
  }






}