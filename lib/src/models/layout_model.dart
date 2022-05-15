import 'package:designs/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel extends ChangeNotifier {
  Widget _currentPage = SildeShowPage();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}
