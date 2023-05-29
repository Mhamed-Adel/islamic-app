import 'package:flutter/material.dart';
import '../../model/hadeeth.dart';
import './networking_page_content.dart';

class NetworkingPage extends StatelessWidget {

  final Hadith hadith;
  final String data;
  const NetworkingPage( {Key? key, required this.hadith,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NetworkingPageContent(data: data,),
        ],
      ),

    );
  }
}