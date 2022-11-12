import 'dart:convert';

Map<String, dynamic> objectToMap(Map object) {
  Map<String, dynamic> newData = {};

  object.forEach((key, value) {
    String cKey = key;
    dynamic cValue = value;
    // value.map((e) => cValue += e.toString());
    newData.putIfAbsent(cKey, () => cValue);
  });
  return newData;
}

Object objectToData(Map object) {
  late Object data;
  bool dataFound = false;
  object.forEach((key, value) {
    if (!dataFound) {
      data = value;
      dataFound = true;
    }
  });
  return data;
}

List<Map> objectToMapList(Map object) {
  List<Map> list = [];
  bool dataFound = false;
  object.forEach((key, value) {
    // print(objectToMap(value));
    list.add(objectToMap(value));
  });
  return list;
}

dynamic objectToJson(Object object) {
  final jsonString = '$object'
      .replaceAll(RegExp(r'\s+'), '') // To remove all white spaces
      .replaceAll(
          RegExp(r':'), '":"') // To add double-quotes on both sides of colon
      .replaceAll(
          RegExp(r'":"//'), // To remove quotes from links
          '://')
      .replaceAll(
          RegExp(r','), '","') // To add double-quotes on both sides of comma
      .replaceAll(RegExp(r'{'),
          '{"') // To add double-quotes after every open curly bracket
      .replaceAll(RegExp(r'}'), '"}')
      .replaceAll(
          '"[', // To remove quotes from lists
          '["')
      .replaceAll(
          ']"', // To remove quotes from lists
          '"]')
      .replaceAll(
          '["{', // To remove quotes from lists
          '[{')
      .replaceAll(
          '}"]"', // To remove quotes from lists
          '}]')
      .replaceAll(
          '"}"', // To remove quotes from lists
          '"}')
      .replaceAll(
          '"{"', // To remove quotes from lists
          '{"');
  return jsonString; // To add double-quotes before every closing curly bracket
}

dynamic objectToList(Object object) {
  final jsonString = '$object'
      .replaceAll(
          RegExp(r','), '","') // To add double-quotes on both sides of comma
      .replaceAll('[', '["')
      .replaceAll(']', '"]');
  return jsonDecode(
      "{$jsonString}"); // To add double-quotes before every closing curly bracket
}
