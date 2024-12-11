import 'package:digital_trainer/valid_user/extract_data_api/extract_exercise.dart';
import 'package:flutter/material.dart';

class ExerciseTypes extends StatelessWidget {
  //final bool corner;
  const ExerciseTypes({super.key});

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
      ),
      onTap: ()async{
        await availableExe();
      }
    );
  }
}
