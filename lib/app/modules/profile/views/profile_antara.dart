import 'package:flutter/material.dart';

import '../../resource/color.dart';
import '../../resource/string.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double widthDrawer;
  @override
  Widget build(BuildContext context) {
    widthDrawer = MediaQuery.of(context).size.width;
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
        body: SizedBox(
          width: widthDrawer,
          child: Column(
            children: [
              decideHeader(true) as Widget,
              Container(
                margin: const EdgeInsets.fromLTRB(26, 40, 26, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringClass.SEPUTAR_ANTARA_TEXT,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                      ),
                    ),
                    buildTextButton(
                      'assets/icons/icon_press_release.png',
                      StringClass.PRESS_RILIS_TEXT,
                    ),
                    buildTextButton(
                      'assets/icons/icon_jaringan.png',
                      StringClass.JARINGAN_TEXT,
                    ),
                    buildTextButton(
                      'assets/icons/icon_ketentuan_hukum.png',
                      StringClass.KETENTUAN_HUKUM_TEXT,
                    ),
                    buildTextButton(
                      'assets/icons/icon_kebijakan_privasi.png',
                      StringClass.KEBIJAKAN_PRIVASI_TEXT,
                    ),
                    buildTextButton(
                      'assets/icons/icon_tentang_kami.png',
                      StringClass.TENTANG_KAMI_TEXT,
                    ),
                    buildTextButton(
                      'assets/icons/icon_pedoman_media_siber.png',
                      StringClass.PEDOMAN_MEDIA_SIBER_TEXT,
                    ),
                    buildTextButton(
                      'assets/icons/icon_rss.png',
                      StringClass.RSS_TEXT,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton(String iconFile, String judul) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            iconFile,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            judul,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButtonWOIcon(
      String judul, Color backgroundColor, Color textColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(3),
              ),
            ),
            child: Text(
              judul,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? decideHeader(bool isLoggedIn) {
    switch (isLoggedIn) {
      case true:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 24)],
                ),
                currentAccountPictureSize: Size(
                  widthDrawer,
                  56,
                ),
                currentAccountPicture: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: ColorClass.BLACK_OUTLINE_AVATAR,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/bije.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                accountName: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Halo, User1",
                      style: TextStyle(
                        color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                accountEmail: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/icon_setting.png',
                              fit: BoxFit.contain,
                            ),
                            Text(
                              StringClass.PENGATURAN_AKUN_TEXT,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );

      case false:
        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringClass.NON_LOGIN_TEXT,
                      style: const TextStyle(
                        color: ColorClass.BLACK_TEXT_2,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        buildTextButtonWOIcon(StringClass.DAFTAR_TEXT,
                            ColorClass.BLACK_OUTLINE_AVATAR, Colors.white),
                        const SizedBox(
                          width: 8,
                        ),
                        buildTextButtonWOIcon(
                            StringClass.MASUK_TEXT,
                            Colors.white,
                            ColorClass.BLACK_BUTTON_BACKGROUND_COLOR),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      // default: null;
    }
    return null;
  }
}
