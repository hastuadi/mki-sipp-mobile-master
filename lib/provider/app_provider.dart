import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sipp_mobile/provider/base_provider.dart';

class AppProvider extends BaseProvider {

  String _currentDate = '-';
  String get currentDate => _currentDate;

  void getCurrentDate() {
    initializeDateFormatting();
    loading(true);
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    _currentDate = formatter.format(now);
    loading(false);
  }

}