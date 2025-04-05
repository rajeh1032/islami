import 'package:flutter/foundation.dart';
import 'package:islami/utils/shared_pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentleyProvider extends ChangeNotifier {
  List<int> mostRenctelyIndices = [];

  //todo read data
  void refreshMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecntlyIndicesString =
        prefs.getStringList(PrefKey.mostRecntlyKey) ?? [];
    mostRenctelyIndices =
        mostRecntlyIndicesString.map((element) => int.parse(element)).toList();
    notifyListeners();
  }

  //todo update data
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

}

