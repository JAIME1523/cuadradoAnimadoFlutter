import 'package:flutter/foundation.dart';

class SLiderModel extends ChangeNotifier {
  double _currentpage = 0;

  double get currentPage => _currentpage;

  set currentPage(double currrentPage) {
    _currentpage = currrentPage;
    notifyListeners();
  }
}
