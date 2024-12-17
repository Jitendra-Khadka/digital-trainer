import 'package:digital_trainer/authentication_section/google_auth.dart';
import 'package:digital_trainer/inital_pages/first_page.dart';
import 'package:digital_trainer/valid_user/exercise_types.dart';
import 'package:digital_trainer/valid_user/extract_data_api/extract_exercise.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name = FirebaseAuth.instance.currentUser!.displayName;
  late Future<Collect_api_list> items;
  final List<String> images = [
    "images/back.jpg",
    "images/cardio.jpg",
    "images/chest.jpg",
    "images/lower arms.jpg",
    "images/lower legs.jpg",
    "images/neck.jpg",
    "images/shoulder.jpg",
    "images/upper arms.jpg",
    "images/upper legs.jpg",
    "images/waist.jpg"
  ];

  @override
  void initState(){
    super.initState();
    items = Fetch_api("https://exercisedb.p.rapidapi.com/exercises/bodyPartList");
  }

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: items,
          builder: (context,snapshot) {
            if(snapshot.hasData){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize : MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.all(20), child: Text("Hi ! $name", style : TextStyle(color: Colors.white, fontSize: app_width*0.05)),),
                  SizedBox(height: app_height*0.12),
                  Padding(padding: EdgeInsets.all(20), child: Text("Body Parts", style : TextStyle(color: Colors.white, fontSize: app_width*0.06)),),

                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Container(
                        padding: EdgeInsets.zero,
                        //height: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Color(0xFF151313),
                        ),
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            String datamodel  = snapshot.data!.all_items[index];
                            //name_and_image final_model = name_and_image(name: datamodel,);
                            return ExerciseTypes(
                              image: images[index],
                              target_area: datamodel,
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                ],
              );
            }

            else if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else{
              return Center(child: Text("Something is not right ...", style: TextStyle(color: Colors.white, fontSize: app_height*0.06)));
            }
          }
        ),
      ),
    );
  }
}
