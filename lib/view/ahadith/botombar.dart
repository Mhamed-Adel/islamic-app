import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/hadeeth.dart';
import '../../shared/constants/styles.dart';
import '../../shared/networking/networking_page.dart';
import 'local_audio.dart';


class HomeHadith extends StatefulWidget {
  final Hadith hadith;

  const HomeHadith({Key? key, required this.hadith}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeHadithState();
  }
}

class HomeHadithState extends State<HomeHadith> {
  bool bol = true;
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "";

  @override
  void initState() {
    super.initState();
    text = widget.hadith.textHadith!;
  }

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = '$buttonText \n';
    });
  }

  Widget getWedjet(bool bol) {
    if (bol) {
      return NetworkingPage(
        hadith: widget.hadith,
        data: text,
      );
    } else {
      return LocalAudio(
          hadith: widget.hadith,
          localAudioPath: 'audio/${widget.hadith.audioHadith}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: ColorApp.offWhite,
      extendBody: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              getWedjet(bol),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black38,
          onPressed: () {
            setState(() {
              clickedCentreFAB =
                  !clickedCentreFAB; //to update the animated container
            });
            //          Share text
            Share.share(text, subject: widget.hadith.nameHadith);
          },
          tooltip: "Centre FAB",
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: const Icon(Icons.share),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 20.0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 7,
          color: ColorApp.green1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  bol = true;
                  updateTabSelection(0, widget.hadith.textHadith.toString());
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.book,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? ColorApp.yellow1
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bol = true;
                  updateTabSelection(1, widget.hadith.explanationHadith.toString());
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.library_books,
                  color: selectedIndex == 1
                      ? ColorApp.yellow1
                      : Colors.white,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  bol = true;
                  updateTabSelection(2, widget.hadith.translateNarrator.toString());
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.collections_bookmark,
                  color: selectedIndex == 2
                      ? ColorApp.yellow1
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bol = false;
                  updateTabSelection(3,
                      '${widget.hadith.key!} \n${widget.hadith.nameHadith}');
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.volume_up,
                  color: selectedIndex == 3
                      ? ColorApp.yellow1
                      : Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
