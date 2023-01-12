import 'package:an_app_vone/app/modules/resource/color.dart';
import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:flutter/material.dart';

class Rubrik extends StatefulWidget {
  const Rubrik({Key? key}) : super(key: key);

  @override
  State<Rubrik> createState() => _RubrikState();
}

class _RubrikState extends State<Rubrik> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorClass.BROKEN_WHITE_APPBAR,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/text_antara_appbar.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: List.generate(
            choices.length,
            (index) {
              return Center(
                child: SelectCard(choice: choices[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String? title;
  final String? icon;
}

List<Choice> choices = <Choice>[
  Choice(
      title: StringClass.BERITA_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_berita.png'),
  Choice(
      title: StringClass.BISNIS_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_bisnis.png'),
  Choice(
      title: StringClass.SPORTS_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_sports.png'),
  Choice(
      title: StringClass.BOLA_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_bola.png'),
  Choice(
      title: StringClass.LIFESTYLE_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_lifestyle.png'),
  Choice(
      title: StringClass.FOTO_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_foto.png'),
  Choice(
      title: StringClass.VIDEO_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_video.png'),
  Choice(
      title: StringClass.ANTARA_GRAFIK_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_antaragrafik.png'),
  Choice(
      title: StringClass.MORE_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_more.png'),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              choice.icon ?? "",
              fit: BoxFit.contain,
            ),
            Text(
              choice.title ?? "",
            ),
          ],
        ),
      ),
    );
  }
}


