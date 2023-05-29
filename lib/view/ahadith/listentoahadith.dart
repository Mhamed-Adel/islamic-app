import 'package:ahadeeth_app/database/data.dart';
import 'package:ahadeeth_app/model/hadeeth.dart';
import 'package:ahadeeth_app/view/ahadith/local_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../shared/constants/styles.dart';

class ListenAhadithScreen extends StatelessWidget {
  const ListenAhadithScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
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
                                Get.back(closeOverlays: true);
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
                        'الاستماع للاحاديث',
                        style: subHeadingStyle,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(
                  'assets/svg/background.svg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                FutureBuilder(
                  builder: (BuildContext context,AsyncSnapshot  snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                      Hadith item = snapshot.data![index];
                      return GestureDetector(
                        
                        onTap: () {
                          Get.to(LocalAudio(localAudioPath: 'audio/${item.audioHadith}', hadith: item));
                        },
                        child: ayah(item.key!, item.nameHadith!));

                        },
                        itemCount: snapshot.data!.length,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                  future: Mydata.getAlldata(),
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
    textDirection: TextDirection.rtl,
    alignment: Alignment.center,
    children: [
      Image.asset("assets/images/img.png",),
      SvgPicture.asset("assets/svg/grey.svg"),
      Column(
        textDirection: TextDirection.rtl,
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
