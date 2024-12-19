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

  late List<dynamic> selected = [];
  late List<dynamic> allExercise = [];
  late Future<List<dynamic>> api_data = fetch_exercise(widget.name);

  TextEditingController controller = TextEditingController();

  // void assign_values(){
  //   allExercise = api_data as List;
  //   selected = api_data as List;
  // }

  // @override
  // void initState(){
  //   super.initState();
  //   assign_values();
  //   controller.addListener((){
  //     setState((){
  //       if(controller.text.isEmpty){
  //         selected = allExercise ;
  //       }
  //
  //       else{
  //
  //         print(selected);
  //         selected = allExercise.where((fruit){
  //           print("This is what we call fruit : $fruit");
  //           return fruit.name.toLowerCase().contains(controller.text.toLowerCase());
  //         }).toList();
  //       }
  //     });
  //   });
  // }
  //
  // @override
  // void dispose(){
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: api_data,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }

              else if(snapshot.hasData){
                allExercise = snapshot.data!;
                selected = snapshot.data!;
                return Container(
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

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: app_width* 0.015),
                                child: TextField(
                                  controller: controller,
                                  onChanged: (value){
                                    setState(() {
                                      selected = allExercise.where((exe){
                                        return exe.name.toLowerCase().contains(value.toLowerCase());
                                      }).toList();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    hintStyle: TextStyle(color: Colors.white54),
                                    suffixIcon: Icon(Icons.search, color: Colors.blue),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                  ),

                                ),
                              ),

                              Expanded(
                                child: Container(
                                  color: Colors.purple,
                                  child: ListView.builder(
                                    itemCount: selected.length,
                                    itemBuilder: (context,index){
                                      return Text(selected[index].name);
                                    }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Spacer(),

                    ],
                  ),
                );
              }
              else if(!snapshot.hasData){
                return const Center(child: Text("Don't have data "));
              }
              else{
                return const Center(child: Text("Some thing has gone wrong"));
              }
            }
        )
      ),
    );
  }
}