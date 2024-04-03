import 'package:flutter/cupertino.dart';

class BaseProvider extends ChangeNotifier {

  bool isDisposed = false;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  loading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if(!isDisposed) super.notifyListeners();
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

}