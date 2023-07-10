import 'package:comic_app/core/models/issue_details_model.dart';
import 'package:comic_app/core/services/comics_services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DetailsPageController extends ControllerMVC {
  Results? details;
  late bool error = false;
  late bool loading = false;

  Future<void> fetchData({
    required int id,
    bool loading = true,
  }) async {
    setState(() => error = false);
    if (loading) {
      setState(() => loading = true);
    }
    await comicsServices.getIssueDetails(id).then((IssueDetailsModel result) {
      details = result.results;
    }).whenComplete(() {
      setState(() => loading = false);
    });
  }

}