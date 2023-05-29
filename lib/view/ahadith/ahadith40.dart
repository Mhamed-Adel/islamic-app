import 'package:ahadeeth_app/database/data.dart';
import 'package:ahadeeth_app/model/hadeeth.dart';
import 'package:ahadeeth_app/view/ahadith/botombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../shared/constants/styles.dart';

class AhadithScreen extends StatelessWidget {
  const AhadithScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
          child: Column(
            textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/background.svg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                                textDirection: TextDirection.rtl,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_forward_ios)),
                          const SizedBox(
                            width: 110,
                          ),
                          SvgPicture.asset('assets/svg/logo.svg'),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'الاحاديث الاربعين',
                        style: subHeadingStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(            textDirection: TextDirection.rtl,

              children: [
                SvgPicture.asset(
                  'assets/svg/background.svg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                FutureBuilder(
                  future: Mydata.getAlldata(),
                  builder: (BuildContext  context,AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (context,int index) {
                      Hadith item = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(HomeHadith(hadith: item));
                        },
                        child: ayah(item.key!, item.nameHadith!));
                        },
                        itemCount: snapshot.data!.length,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                  
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

Widget ayah(String key, name) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset("assets/images/img.png",),
      SvgPicture.asset("assets/svg/grey.svg"),
      Column(            textDirection: TextDirection.rtl,

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            key,
            style: const TextStyle(fontSize: 16, color: ColorApp.yellow1),
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorApp.yellow1),
            textScaleFactor: .5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      )
    ],
  );
}
