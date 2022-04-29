import 'package:flutter/foundation.dart';

class SliderModel extends ChangeNotifier {
  double _currentpage = 0;

  double get currentPage => _currentpage;

  set currentPage(double pagina) {
    _currentpage = pagina;
    notifyListeners();
  }




}
