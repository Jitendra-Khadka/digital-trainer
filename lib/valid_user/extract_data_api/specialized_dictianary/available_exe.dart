import 'package:flutter/material.dart';

class AvailableExe extends StatelessWidget {
  final image;
  final String name;
  const AvailableExe({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              height: app_height*0.12,
              width: app_width*0.30,
              child: Image.network(image),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: app_width*0.1),
              child: Text(name, style: TextStyle(color: Colors.white, fontSize: app_height*0.027, fontWeight: FontWeight.w700)),
            ),
        ],
        ),
      ),
      onTap: (){
        // aaile ko lagi it is khali so run bitch ,
      }
    );
  }
}
