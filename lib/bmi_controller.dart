// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyObject {
//   final int id;
//   final String name;

//   MyObject({required this.id, required this.name});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }

//   factory MyObject.fromMap(Map<String, dynamic> map) {
//     return MyObject(
//       id: map['id'],
//       name: map['name'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MyObject.fromJson(String source) =>
//       MyObject.fromMap(json.decode(source));
// }

// class MyApp extends StatelessWidget {
//   final List<MyObject> myObjects = [
//     MyObject(id: 1, name: 'Object 1'),
//     MyObject(id: 2, name: 'Object 2'),
//     MyObject(id: 3, name: 'Object 3'),
//   ];

//   Future<void> saveMyObjects() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> myObjectsJson = myObjects.map((obj) => obj.toJson()).toList();
//     await prefs.setStringList('my_objects', myObjectsJson);
//   }

//   Future<List<MyObject>> getMyObjects() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> myObjectsJson = prefs.getStringList('my_objects') ?? [];
//     return myObjectsJson.map((json) => MyObject.fromJson(json)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
