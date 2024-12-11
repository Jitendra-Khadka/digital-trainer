import 'package:digital_trainer/authentication_section/google_auth.dart';
import 'package:digital_trainer/inital_pages/first_page.dart';
import 'package:digital_trainer/valid_user/exercise_types.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  Home({super.key});
  String? name = FirebaseAuth.instance.currentUser!.displayName;

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize : MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.all(20), child: Text("Hi ! $name", style : TextStyle(color: Colors.white, fontSize: app_width*0.05)),),

            SizedBox(height: app_height*0.12),
            Padding(padding: EdgeInsets.all(20), child: Text("Body Parts", style : TextStyle(color: Colors.white, fontSize: app_width*0.06)),),

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
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
                  child: ListView(
                    children: const [
                      ExerciseTypes(),
                      ExerciseTypes(),
                      ExerciseTypes(),
                      ExerciseTypes(),
                      ExerciseTypes(),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
