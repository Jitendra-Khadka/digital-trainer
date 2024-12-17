import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  final name;
  const Intro({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    double app_height = MediaQuery.of(context).size.height;
    double app_width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: app_height * 0.15,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(name.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: app_height* 0.03, fontWeight: FontWeight.w700))),

          SizedBox(height: app_height*0.04),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Various", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: app_height* 0.02)),
                    TextSpan(text: "\nEquipments", style: TextStyle(color: Color(0xFFC1B3B3), fontSize: app_height* 0.02))
                  ],
                ),
              ),

              Container(
                height: app_height*0.06,
                width: app_width* 0.003,
                color: Colors.black,
              ),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: app_height* 0.02)),
                    TextSpan(text: "\nfocus area", style: TextStyle(color: Color(0xFFC1B3B3), fontSize: app_height* 0.02))
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
