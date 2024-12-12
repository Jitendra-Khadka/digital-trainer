import 'package:digital_trainer/valid_user/extract_data_api/extract_exercise.dart';
import 'package:flutter/material.dart';

class ExerciseTypes extends StatelessWidget {
  //final bool corner;
  //final image_link;
  //required this.image_link,
  final String? target_area;
  const ExerciseTypes({super.key, required this.target_area});

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
        child: ListTile(
          //leading: Image.network("$image_link"),
          title: Text(target_area!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: (){}
          ),
        ),
      ),
      onTap: ()async{
        //await availableExe();
      }
    );
  }
}
