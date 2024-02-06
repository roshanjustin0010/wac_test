import 'package:flutter/cupertino.dart';

class NavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    print(currentIndex);
    notifyListeners();
  }
}
