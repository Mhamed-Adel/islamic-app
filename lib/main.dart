import 'package:ahadeeth_app/shared/constants/const_quran.dart';
import 'package:ahadeeth_app/shared/constants/styles.dart';
import 'package:ahadeeth_app/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  
}


class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    WidgetsBinding
        .instance
        .addPostFrameCallback(

            (_) async{
      await readJson();
      await getSettings();
    }



    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IslamicApp',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primary)
      ),
      home:  const MainPage(),
    );
  }
}
