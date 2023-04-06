import 'package:shared_preferences/shared_preferences.dart';

class Person {
  final int id;
  late String name;
  late int age;
  late double height; //metre
  late double weight; //kg
  late String gender;
  late double bmi; //kg/m2

  get getbmi => weight / (height * height);

  Person({required this.id});

  Person.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        height = json['height'],
        weight = json['weight'],
        gender = json['gender'],
        bmi = json['bmi'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'age': age,
        'height': height,
        'weight': weight,
        'gender': gender,
        'bmi': bmi,
      };

}
