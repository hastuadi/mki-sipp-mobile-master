import '../../model/research_detail_response.dart';
import '../../model/research_list_response.dart';

abstract class ResearchRepo {
  Future<ResearchListResponse?> getResearchList();
  Future<ResearchDetailResponse?> getDetail(Map<String, int> body);
}