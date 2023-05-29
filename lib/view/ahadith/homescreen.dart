import 'package:ahadeeth_app/view/ahadith/ahadith40.dart';
import 'package:ahadeeth_app/view/ahadith/listentoahadith.dart';
import 'package:ahadeeth_app/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constants/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(

        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svg/background.svg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 10),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: SvgPicture.asset('assets/svg/logo.svg')),
                  const SizedBox(height: 20,),
                  Text('الأربعين النووية',
                      style: GoogleFonts.tajawal(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.voilent)),
                  Text('لحفظ وسماع الاحاديث النبوية',
                      style: GoogleFonts.tajawal(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.green1)),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> const AhadithScreen());
                    },
                    child: myCard(
                      ColorApp.green1,
                     ColorApp.green1
                    , 'الاحاديث الاربعين', 
                    'assets/images/quran.png', 
                    'assets/svg/one.svg'
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>const ListenAhadithScreen());
                    },
                    child: myCard(
                      Colors.orange,
                     ColorApp.yellow1
                    , 'الاستماع للاحاديث', 
                    'assets/images/play.png', 
                    'assets/svg/twoo.svg'
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(()=>const MainPage()),
                    child: myCard(
                      ColorApp.red,
                     ColorApp.voilent
                    , 'العودة للرئيسية', 
                    'assets/images/save-instagram.png', 
                    'assets/svg/three.svg'
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myCard(
  Color color1,
  color2,
  String text,
  path1,
  path2,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
    child: Container(
        height: 117,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [
                  color1,
                  color2,
                ],
                begin: AlignmentDirectional.topEnd,
                end: AlignmentDirectional.bottomStart)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ Image.asset(path1, width: 70, height: 70),
            Text(
              text,
              style: headingStyle,
            ),
            SvgPicture.asset(
              path2,
            )],
        )),
  );
}
