import 'package:digital_trainer/valid_user/extract_data_api/extract_exercise.dart';
import 'package:digital_trainer/valid_user/extract_data_api/specialized_dictianary/intro.dart';
import 'package:flutter/material.dart';

class SpecifiedList extends StatefulWidget {
  final String image;
  final String name;
  const SpecifiedList({super.key, required this.image, required this.name});

  @override
  State<SpecifiedList> createState() => _SpecifiedListState();
}

class _SpecifiedListState extends State<SpecifiedList> {

  late Future<DataModel> data;
  List<String> fruits = ["apple","banana","orange", "cocnut"];

  @override
  // void initState(){
  //   super.initState();
  //   data = fetch_exercise(widget.name);
  // }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: app_height,
          width: app_width,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color:Colors.red,
                    height: app_height* 0.3,
                    width: app_width,
                    child: Image.asset(widget.image, fit: BoxFit.cover),
                  ),

                  Positioned(
                    left : 0.02*app_width,
                    top : 0.02 * app_height,
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: (){
                          Navigator.pop(context);
                        }
                    ),
                  ),
                ],
              ),



              Expanded(
                child: Container(
                  padding: EdgeInsets.zero,
                  //color: Color(0xFF565252),
                  //height: app_height*0.75,
                  //width: app_width,
                  child: Column(

                    children: [
                      Intro(name: widget.name),
                      Divider(
                        color: Colors.black,
                        thickness: app_height* 0.002,
                      ),

                      Autocomplete<String>(
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
                      ),

                      // Expanded(
                      //   child: Container(
                      //     //color: Colors.purple,
                      //     // child: ListView(
                      //     //   children: [
                      //     //     Text("Konse color le chade paney ho ?"),
                      //     //   ],
                      //     // ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              //Spacer(),

            ],
          ),
        ),
      ),
    );;
  }
}