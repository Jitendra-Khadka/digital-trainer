import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Collect_api_list> Fetch_api(String url)async {
  try{
    final response  = await http.get(Uri.parse(url),
    headers: {
      'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
      'x-rapidapi-key': '1e379f18c8mshec62b544c133facp1a7f83jsn956a449f9f88'
    }
    );
    final List<dynamic> api_data = jsonDecode(response.body);
    //return data model here
    return Collect_api_list(all_items: api_data);
  }
  catch(e){
    throw FormatException("$e");
  }
}

class Collect_api_list{
  List<dynamic> all_items = [];
  Collect_api_list({required this.all_items});
}

class name_and_image{
  String name;
  //String image_url;

  name_and_image({required this.name, });

  factory name_and_image.fromjson(Map<String, dynamic> json){
    return name_and_image(
      name: json['body_part'],
      //image_url: json['gifUrl']
    );
  }
}

Future<List<dynamic>> fetch_exercise(String body_part)async{
  try{
    final exercise = await http.get(Uri.parse("https://exercisedb.p.rapidapi.com/exercises/bodyPart/$body_part?limit=10&offset=0"),
    headers: {
      'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
      'x-rapidapi-key': '1e379f18c8mshec62b544c133facp1a7f83jsn956a449f9f88'
    }
    );
    if(exercise.statusCode == 200){
      final decoded_data = jsonDecode(exercise.body);
      print("data execrated successfully boy ........... hehe boy /////////////////");
      final final_data = decoded_data.map((json){
        print(json.runtimeType);
        return DataModel(
            name: json['name'],
            gifUrl: json["gifUrl"],
            equipment: json["equipment"],
            instructions : json["instructions"]
        );
      }).toList();

      //print("This is the value of final_data : \n$final_data");
      return final_data;
    }
    else{
      return  throw Exception("Failed to extract data from APi");
    }
  }catch(e){
    print("This is the error : $e");
    print("hello hello my testing my testing");
    throw const FormatException("Connect fetch data from API");
  }
}

class DataModel{
  final name;
  final gifUrl;
  final equipment;
  List<dynamic> instructions;
  DataModel({required this.name, required this.gifUrl, required this.equipment, required this.instructions});

  factory DataModel.fromjson(Map<String, dynamic>json){
    return DataModel(
      name: json['name'],
      gifUrl: json["gifUrl"],
      equipment: json["equipment"],
      instructions: json["instructions"] as List<String>
    );
  }
}