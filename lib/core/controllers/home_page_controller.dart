import 'package:comic_app/core/models/issues_model.dart';
import 'package:comic_app/core/services/comics_services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePageController extends ControllerMVC {
  List<Result>? list;
  late bool error = false;
  late int offset = 0;
  late bool loading = false;
  late int totalResults = 0;

  Future<void> fetchData({
    required bool refresh,
    bool loading = true,
  }) async {
    if (refresh) {
      setState(() => offset = 0);
      if (loading) list = null;
    }
    setState(() => error = false);
    if (loading) {
      setState(() => loading = true);
    }
    await comicsServices.getIssues(offset).then((IssuesModel result) {
      if (offset == 0) {
        setState(() => list = result.results);
      } else {
        list?.addAll(result.results);
      }
      setState(() {
        offset = offset + 50;
        totalResults = result.numberOfTotalResults;
      });
    }).catchError((error) {
      error = true;
    }).whenComplete(() {
      setState(() => loading = false);
    });
  }

}