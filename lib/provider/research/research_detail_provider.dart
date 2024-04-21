import 'package:sipp_mobile/model/research_detail_response.dart';
import 'package:sipp_mobile/provider/base_provider.dart';
import 'package:sipp_mobile/repository/research/research_repo.dart';

import '../../component/other/snackbar.dart';

class ResearchDetailProvider extends BaseProvider {

  ResearchRepo repo;
  ResearchDetailProvider(this.repo);

  ResearchDetailResponse? _detailResponse;
  ResearchDetailResponse? get detailResponse => _detailResponse;

  Future<void> getDetail(int masterImageId) async {
    try {
      loading(true);
      Map<String, int> body = {
        "master_menu_id": masterImageId
      };
      _detailResponse = await repo.getDetail(body);
      loading(false);
    } catch (e) {
      loading(false);
      AppSnackBar.instance.show("Terjadi Kesalahan, Coba Beberapa Saat Lagi");
    }
  }

}