import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For making HTTP requests

Future<void> availableExe() async {
  final url = Uri.parse(
      'https://exercisedb.p.rapidapi.com/exercises/bodyPart/back?limit=10&offset=0');
  try {
    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
        'x-rapidapi-key': '1e379f18c8mshec62b544c133facp1a7f83jsn956a449f9f88'
      },
    );

    if (response.statusCode == 200) {
      print("Data fetched successfully from API:");
      final value = jsonDecode(response.body);
      // print(value.length());
      DataModel(fetched_data: jsonDecode(response.body));
    } else {
      print("Error: Could not fetch data from the API. Status Code: ${response.statusCode}");
    }
  } catch (e) {
    print("An exception occurred: $e");
  }
}

class DataModel{
  List<dynamic> fetched_data;
  DataModel({required this.fetched_data});
}


