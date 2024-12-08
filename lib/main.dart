import "package:digital_trainer/inital_pages/first_page.dart";
import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF3E3939)
      ),
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    ),
  );
}