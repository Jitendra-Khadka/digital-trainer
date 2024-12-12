import 'package:digital_trainer/valid_user/extract_data_api/extract_exercise.dart';
import 'package:digital_trainer/valid_user/home.dart';
import 'package:flutter/material.dart';
import 'package:digital_trainer/authentication_section/google_auth.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {

    void unavailable_function(){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("This feature is not available at the current moment.")),
      );
    }

    void signupWithgoogle()async{
      await get_data().then((_){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context){
              //Fetch_api();
              return Home();
            })
        );
      });

    }

    final double app_height = MediaQuery.of(context).size.height;
    final double app_width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text("Signin To Startup", style: TextStyle(color: Colors.white, fontSize: app_width*0.1, fontWeight: FontWeight.w700)),

                SizedBox(height: app_height*0.02),

                PageButton("Sign in", (){}, app_width*0.04),

                SizedBox(height: app_height*0.03),

                Center(
                  child: Container(
                    height: app_height*0.30,
                    child: Image.asset("images/logo.png"),
                  ),
                ),

                SizedBox(height: app_height*0.04),
                sizeButton(PageButton("Signin with Google",signupWithgoogle , app_width*0.04), app_width*0.55),
                SizedBox(height: app_height*0.01),
                sizeButton(PageButton("Signin with Facebook", unavailable_function, app_width*0.04), app_width*0.55),
                SizedBox(height: app_height*0.01),
                sizeButton(PageButton("Signin with Twitter", unavailable_function, app_width*0.04), app_width*0.55),

                SizedBox(height: app_height*0.03),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: app_width* 0.04),
                      ),

                      TextSpan(
                        text: "Login",
                        style: TextStyle(color: Colors.red, fontSize: app_width*0.04),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          )
        ),
    );
  }
}

ElevatedButton PageButton(String btn_name, func,double font_size){ // this function is used to build button through out this file
  return ElevatedButton(

    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      shape : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    onPressed: (){func();},
    child: Text(btn_name, style: TextStyle(color: Colors.white, fontSize: font_size)),
  );
}

Container sizeButton(ElevatedButton btn, double width){
  return Container(
    padding: EdgeInsets.zero,
    width: width,
    child: btn,
  );
}
