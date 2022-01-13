import 'package:flutter/cupertino.dart';

class AddPhotoProvider extends ChangeNotifier {
  String path = "";
  String get getPath => path;
  void setPath(String path) {
    this.path = path;
    notifyListeners();
  }
}
