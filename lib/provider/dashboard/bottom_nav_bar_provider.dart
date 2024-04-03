import 'package:sipp_mobile/provider/base_provider.dart';

class BottomNavBarProvider extends BaseProvider {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  changeTabMenu(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

}