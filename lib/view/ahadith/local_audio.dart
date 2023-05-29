import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/hadeeth.dart';
import '../../shared/constants/styles.dart';

class LocalAudio extends StatefulWidget {
  final Hadith hadith;
  final String localAudioPath;
  const LocalAudio({Key? key,  required this.localAudioPath, required this.hadith}) : super(key: key);

  @override
  _LocalAudio createState() =>  _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration =   Duration.zero;
  Duration _position =   Duration.zero;
  bool isPlaying = false;
  static AudioPlayer  advancedPlayer = AudioPlayer();
final  AudioCache  audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
     initPlayer();
  }
  
  void initPlayer() {
    advancedPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    advancedPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    advancedPlayer.onPlayerStateChanged.listen((event) {
    setState(() {
      isPlaying = event == PlayerState.playing;
    });
    });
  }


  Widget _tab(List<Widget> children) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        slider(),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: children
                .map((w) => Container(padding: const EdgeInsets.all(6.0), child: w))
                .toList(),
          ),
        ),
      ],
    );
  }

  //// test
  // VoidCallback onPressedplypus(){
  //   bool bol=true;
  //   if(bol){
  //     audioCache.play("path");
  //     _btn(const Icon(Icons.play_arrow), () => advancedPlayer.pause());
  //   }else{
  //     bol=false;
  //     advancedPlayer.pause();
  //     _btn(const Icon(Icons.pause), () => advancedPlayer.pause());
  //   }

  // }
  Widget _btn(Icon icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 50.0,
      child: SizedBox(
        width: 70,
        height: 60,
        child: MaterialButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.black45,
            textColor: ColorApp.yellow1,
            onPressed: onPressed,
            child: icon),
      ),
    );
  }

  Widget slider() {
    return Slider(
      
        activeColor: ColorApp.yellow1,
        inactiveColor: Colors.black45,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget localAudio( String path) {

    return _tab([
      _btn(Icon( isPlaying ? Icons.pause : Icons.play_arrow,), () {
        if(isPlaying) {
        advancedPlayer.pause();
      }else{
        advancedPlayer.play(AssetSource(path));
      }
      }),
      _btn(const Icon(Icons.stop), () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorApp.yellow1
              ),
              child: SvgPicture.asset('assets/svg/yellowlogo.svg'),
              ),
            ),
            Container(
            // decoration: const BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/logo.png'))),
            child:    localAudio(widget.localAudioPath),
          
          
          ),
          ],
        ),
      ),) ;
  }

}