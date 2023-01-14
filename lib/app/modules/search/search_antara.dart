import 'package:an_app_vone/app/modules/profile/views/profile_antara.dart';
import 'package:an_app_vone/app/modules/resource/color.dart';
import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:flutter/material.dart';

import '../login/views/login_antara.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorClass.BROKEN_WHITE_APPBAR,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ColorClass.GREY_BUTTON,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Pencarian Piala Dunia Hardcode",
                            style: TextStyle(
                              fontSize: 11,
                              color: ColorClass.BLACK_TEXT,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButtonWOutline(
                  icon: "assets/icons/icon_filter.png",
                  text: StringClass.FILTER_TEXT,
                  icon2: "assets/icons/icon_down_arrow.png",
                  functionOnPress: {
                    //popup bottom drawer
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [Text("TEST1"), Text("TEST2")],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: Text("Go To Login Page"),
            )
          ],
        ),
      ),
    );
  }
}
