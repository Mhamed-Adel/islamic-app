import 'package:ahadeeth_app/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class NetworkingPageContent extends StatefulWidget {
  final String data;


  const NetworkingPageContent({Key? key, required this.data}) : super(key: key);

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SafeArea(
          child: Column(
        
            children: [
              Column(
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(""),
                      SvgPicture.asset("assets/svg/logo.svg"),
                      const Icon(Icons.arrow_forward_ios),

                    ],
                  ),
                  SizedBox(height: 15,),
                  const Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
        
                    ],
                  ),
                ],
              ),
              _convertHadith(context, widget.data),
            ],
          ),
        ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", (e.substring(texts.first.length + 1))]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      style: const TextStyle(fontSize: 20, color: ColorApp.yellow1),
      //style: DefaultTextStyle.of(context).style,
      children: [TextSpan(text: split.first), ...hadiths
          .map((text) => text.contains("{")
              ? TextSpan(text: text, style: GoogleFonts.tajawal(color: ColorApp.green1,fontSize: 25))
              : TextSpan(text: text,style: GoogleFonts.tajawal(color: Colors.grey,fontSize: 18)))
          .toList()],
    ),
    textDirection: TextDirection.rtl,
  );
}
