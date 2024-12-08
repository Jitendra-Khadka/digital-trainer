import 'package:digital_trainer/inital_pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double app_height = MediaQuery.of(context).size.height;
    final double app_width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text("Health is wealth", style: TextStyle(color: Colors.white, fontSize: app_width*0.1, fontWeight: FontWeight.w700)),
              //const SizedBox(height: 30),
              Text("Stay strong!", style: TextStyle(color: Colors.red, fontSize: app_width*0.06, fontWeight: FontWeight.w500)),

              const SizedBox(height: 40),
              Center(
                child: Container(
                  height: app_height*0.5,
                  child: Image.asset("images/logo.png"),
                ),
              ),

              const Spacer(),
              ElevatedButton(
                child: Text("Start building your body", style: TextStyle(color: Colors.white, fontSize: app_width*0.04)),
                onPressed: (){
                  Navigator.pushReplacement(
                    context ,
                    MaterialPageRoute(
                        builder: (context) => Signup(),
                    )
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: (){
                  SystemNavigator.pop();
                },
                child: Text("Quit ?", style: TextStyle(color: Colors.white, fontSize: app_width*0.05)),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
