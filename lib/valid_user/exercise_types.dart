import 'package:digital_trainer/valid_user/extract_data_api/extract_exercise.dart';
import 'package:flutter/material.dart';

class ExerciseTypes extends StatelessWidget {
  final image;
  final String? target_area;
  const ExerciseTypes({super.key, required this.target_area, required this.image});

  @override
  Widget build(BuildContext context) {
    final double app_height = MediaQuery.of(context).size.height;
    final double app_width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 0.002*app_height),
        height: 0.126*app_height,
        decoration: BoxDecoration(
          color: Color(0xFF565252),
        ),
        child: Center(
          child:Expanded(
            child: Padding(
              padding: EdgeInsets.all(app_height*0.01),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: app_height*0.12,
                      width: app_width*0.30,
                      child: Image.asset(image),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: app_width * 0.1),
                    child: Text
                      ("$target_area",
                      style: TextStyle(color: Colors.white, fontSize: app_height*0.027, fontWeight: FontWeight.w700)
                      ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward, color:Colors.black),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: ()async{
        //await availableExe();
      }
    );
  }
}
