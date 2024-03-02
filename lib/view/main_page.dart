import 'package:ahadeeth_app/view/ahadith/homescreen.dart';
import 'package:ahadeeth_app/view/quraan/quraanmain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constants/styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: SvgPicture.asset('assets/svg/logo.svg')),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('اقرأ',
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.tajawal(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.green1)),
                  Text('قراءة القرأن وحفظ وسماع الاحاديث النبوية',
                  
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.tajawal(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.voilent)),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const IndexPage());
                    },
                    child: myCard(
                        Colors.green,
                        ColorApp.green2,
                        'قراءة القرأن',
                        'assets/images/icon.png',
                        'assets/svg/one.svg'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const HomeScreen());
                    },
                    child: myCard(
                        ColorApp.red,
                        ColorApp.voilent,
                        'الاربعون النووية',
                        
                        'assets/images/quran.png',
                        'assets/svg/twoo.svg'),
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
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(path1, width: 70, height: 70)),
            Expanded(flex: 3,
              child: Text(
                
                text,
                style: headingStyle,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(flex: 1,
              child: SvgPicture.asset(
                path2,
              ),
            )
          ],
        )),
  );
}
