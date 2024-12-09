import "package:digital_trainer/inital_pages/first_page.dart";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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