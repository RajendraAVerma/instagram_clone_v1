import 'package:flutter/cupertino.dart';

class NewAccountFormProvider extends ChangeNotifier {
  bool isLoading = false;
  String gender = 'M';
  bool get getIsLoading => isLoading;
  String get getGender => gender;
  void changeLoadingStatus(bool bool) {
    isLoading = bool;
    notifyListeners();
  }

  void setGender(String G) {
    gender = G;
    notifyListeners();
  }
}
