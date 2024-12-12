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