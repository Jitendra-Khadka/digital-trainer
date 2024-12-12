import "package:digital_trainer/inital_pages/first_page.dart";
import "package:digital_trainer/valid_user/extract_data_api/extract_exercise.dart";
import "package:digital_trainer/valid_user/home.dart";
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthenticatedorNot extends StatelessWidget {
  const AuthenticatedorNot({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            //Fetch_api();
            return Home();
          }

          else{
            return const FirstPage();
          }
        }
    );
  }
}

