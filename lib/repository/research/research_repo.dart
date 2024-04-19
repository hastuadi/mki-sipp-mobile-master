import '../../model/research_list_response.dart';

abstract class ResearchRepo {
  Future<ResearchListResponse?> getResearchList();
}