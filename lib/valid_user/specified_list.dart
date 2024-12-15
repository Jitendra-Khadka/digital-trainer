import 'package:flutter/material.dart';

class SpecifiedList extends StatelessWidget {
  final String image;
  const SpecifiedList({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.purple,
          height: app_height,
          width: app_width,
          child: Stack(
            children: [
              Container(
                color:Colors.red,
                height: app_height* 0.3,
                width: app_width,
                child: Image.asset(image, fit: BoxFit.cover),
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



              Positioned(
                top: app_height*0.25,
                //left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.yellow,
                    height: app_height*0.75,
                    width: app_width,

                    child: ListView(
                      children: [
                        Text("hello world"),
                      ],
                    ),
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

