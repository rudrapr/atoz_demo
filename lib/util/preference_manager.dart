import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static const String QUERIES = 'queries';

  Future saveQueries(List<String> queries) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(QUERIES, queries);
  }

  Future<List<String>> readQueries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(QUERIES) ?? <String>[];
  }

  Future clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
