import 'package:shared_preferences/shared_preferences.dart';

class PrefKey {
  static const String mostRecntlyKey = "most_recently_key";
}

void updateMostRecentIndcisList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecntlyIndicesList =
      prefs.getStringList(PrefKey.mostRecntlyKey) ?? [];
  if (mostRecntlyIndicesList.contains("${newSuraIndex}")) {
    mostRecntlyIndicesList.remove("${newSuraIndex}");
    mostRecntlyIndicesList.insert(0, "${newSuraIndex}");
  } else {
    mostRecntlyIndicesList.insert(0, "${newSuraIndex}");
  }
  if (mostRecntlyIndicesList.length > 5) {
    // mostRecntlyIndicesList.removeLast();
    mostRecntlyIndicesList = mostRecntlyIndicesList.sublist(0, 5);
  }

  await prefs.setStringList(PrefKey.mostRecntlyKey, mostRecntlyIndicesList);
}

Future<List<int>> readMostRecently() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecntlyIndicesString =
      prefs.getStringList(PrefKey.mostRecntlyKey) ?? [];
  List<int> mostRecntlyIndicesAsInt =
      mostRecntlyIndicesString.map((element) => int.parse(element)).toList();
  return mostRecntlyIndicesAsInt;
}
