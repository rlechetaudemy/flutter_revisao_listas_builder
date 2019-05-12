
import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:flutter_revisao_listas_builder/domain/dog.dart';

class DogService {

  static Future<List<Dog>> getDogs() async {
    try {
      await Future.delayed(Duration(seconds: 1));

      String json = await rootBundle.loadString("assets/json/dogs.json");

      final map = convert.json.decode(json);

      String data = map["dataAula"];
      print("Data: $data");

      int qtdeAlunos = map["qtdeAlunos"];
      print("Qtde Alunos: $qtdeAlunos");

      final lista = map["lista"];

      final dogs = lista.map<Dog>(
              (json) => Dog.fromJson(json)).toList();

      //print("Dogs $dogs");

      return dogs;
    } catch (error) {
      print(error);
    }
  }

  static List<Dog> getDogsNormal() {

    final list = List<Dog>();

    list.add(Dog("Dog 1","dog1.png"));
    list.add(Dog("Dog 2","dog2.png"));
    list.add(Dog("Dog 3","dog3.png"));
    list.add(Dog("Dog 4","dog4.png"));
    list.add(Dog("Dog 5","dog5.png"));

    return list;
  }
}