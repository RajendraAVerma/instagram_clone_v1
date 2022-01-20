import 'package:flutter/cupertino.dart';

class AddPhotoProvider extends ChangeNotifier {
  String path = "";
  String get getPath => path;
  bool isLoading = false;
  bool get getLoading => isLoading;
  void setPath(String path) {
    this.path = path;
    notifyListeners();
  }

  void changeLoadingStatus(bool bool) {
    this.isLoading = bool;
    notifyListeners();
  }
}
