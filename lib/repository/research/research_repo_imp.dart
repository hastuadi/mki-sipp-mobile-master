import 'package:sipp_mobile/constant/app_constant.dart';
import 'package:sipp_mobile/data/network.dart';
import 'package:sipp_mobile/enums/endpoint.dart';
import 'package:sipp_mobile/repository/research/research_repo.dart';
import 'package:sipp_mobile/util/cache_manager.dart';

import '../../model/research_detail_response.dart';
import '../../model/research_list_response.dart';

class ResearchRepoImp implements ResearchRepo {

  Network service;
  ResearchRepoImp(this.service);

  @override
  Future<ResearchListResponse?> getResearchList() async {
    try {
      String? token = await CacheManager.instance.getUserToken();
      Map<String, String> header = AppConstant.baseHeader;
      header.remove("Content-Type");
      header["Authorization"] = "Bearer ${token ?? ''}";
      Map<String, dynamic>? response = await service.get(Endpoint.researchList.getString, headers: header);
      return ResearchListResponse().fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResearchDetailResponse?> getDetail(Map<String, int> body) async {
    try {
      String? token = await CacheManager.instance.getUserToken();
      Map<String, String> headers = AppConstant.baseHeader;
      headers["Authorization"] = "Bearer ${token ?? ''}";
      headers["Content-Type"] = "application/json";
      Map<String, dynamic>? response = await service.post(Endpoint.researchResult.getString, body, headers: headers);
      return ResearchDetailResponse().fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}