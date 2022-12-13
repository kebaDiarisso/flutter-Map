import 'package:shared_preferences/shared_preferences.dart';

class DatasManager {
  String key = "AnnotationKey";

  Future<List<String>> getDatas() async {
    final instance = await SharedPreferences.getInstance();
    final List<String>? savedList = instance.getStringList(key);
    return savedList ?? [];
  }

  Future<bool> saveDatas(String str) async {
    final instance = await SharedPreferences.getInstance();
    final value = await getDatas();
    value.add(str);
    await instance.setStringList(key, value);
    return true;
  }

  Future<bool> deleteDatas(String str) async {
    final instance = await SharedPreferences.getInstance();
    final value = await getDatas();
    final index = value.indexWhere((s) => (s == str));
    value.removeAt(index);
    await instance.setStringList(key, value);
    return true;
  }
}
