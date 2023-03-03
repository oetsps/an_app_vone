import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:flutter/material.dart';

import '../resource/color.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({Key? key}) : super(key: key);

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.black,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(51, 52, 51, 24),
              child: Image.asset(
                'assets/images/bg_savednews.png',
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringClass.NON_LOGIN_IN_SAVEDNEWS_PAGE_TEXT,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 65),
              child: Text(
                StringClass.NON_LOGIN_DESC_IN_SAVEDNEWS_PAGE_TEXT,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 208,
                        height: 41,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                          border: Border.all(
                            color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Text(
                          StringClass.BUTTON_LOGIN_TEXT,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringClass.AKUN3_TEXT),
                  Text(
                    StringClass.DAFTAR_DISINI_TEXT,
                    style: const TextStyle(
                      color: ColorClass.RED_TEXT_COLOR,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
