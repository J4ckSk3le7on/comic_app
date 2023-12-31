import 'package:comic_app/core/models/issue_details_model.dart';
import 'package:comic_app/core/models/issues_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class _ComicsServices {
  final String _baseUrl = "comicvine.gamespot.com";
  final String _issuesUrl = "/api/issues/";
  final String _issueUrl = "/api/issue/";

  Future<IssuesModel> getIssues(int offset) async {
    Uri url = Uri.https(_baseUrl, _issuesUrl, {
      'api_key': dotenv.env['COMIC_API_KEY'],
      'format': 'json',
      'offset': '$offset',
      'limit': '50'
    });
    var response = await http.get(url);
    final decodedResponse = IssuesModel.fromRawJson(response.body);
    return decodedResponse;
  }

  Future<IssueDetailsModel> getIssueDetails(int id) async {
    Uri url = Uri.https(_baseUrl, '$_issueUrl${4000}-$id', {
      'api_key': dotenv.env['COMIC_API_KEY'],
      'format': 'json',
    });
    var response = await http.get(url);
    final decodedResponse = IssueDetailsModel.fromRawJson(response.body);
    return decodedResponse;
  }

}

final comicsServices = _ComicsServices();