import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  List<String> fruits = ["apple","banana","orange", "cocnut"];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
        optionsBuilder: (TextEditingValue typed_value){
          if(typed_value.text.isEmpty){
            return Iterable.empty();
          }
          else{
            return fruits.where((fruit){
              print("this is the current typed letters : ${typed_value.text}");
              return fruit.toLowerCase().contains(typed_value.text.toLowerCase());
            });
          }
        }
    );
  }
}
