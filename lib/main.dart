import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_mobx/core/init/dio_init.dart';
import 'package:movie_app_mobx/features/splash/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}
Dio dio = NetworkManagerDio.instance.dio;
//bu classtaki instance fonksiyonundaki dio değişkeni

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
