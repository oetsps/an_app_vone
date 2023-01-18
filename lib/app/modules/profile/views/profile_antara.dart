import 'package:an_app_vone/app/modules/rubrik/rubrik_antara.dart';
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
                    BuildTextButton(
                        iconFile: 'assets/icons/icon_press_release.png',
                        judul: StringClass.PRESS_RILIS_TEXT),
                    BuildTextButton(
                        iconFile: 'assets/icons/icon_jaringan.png',
                        judul: StringClass.JARINGAN_TEXT),
                    BuildTextButton(
                        iconFile: 'assets/icons/icon_ketentuan_hukum.png',
                        judul: StringClass.KETENTUAN_HUKUM_TEXT),
                    BuildTextButton(
                        iconFile: 'assets/icons/icon_kebijakan_privasi.png',
                        judul: StringClass.KEBIJAKAN_PRIVASI_TEXT),
                    BuildTextButton(
                        iconFile: 'assets/icons/icon_tentang_kami.png',
                        judul: StringClass.TENTANG_KAMI_TEXT),
                    BuildTextButton(
                        iconFile: 'assets/icons/icon_pedoman_media_siber.png',
                        judul: StringClass.PEDOMAN_MEDIA_SIBER_TEXT),
                    BuildTextButton(
                        iconFile: 'assets/icons/icon_rss.png',
                        judul: StringClass.RSS_TEXT),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TextButton buildTextButton(String iconFile, String judul) {
  //   return TextButton(
  //     onPressed: () {},
  //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Image.asset(
  //           iconFile,
  //           fit: BoxFit.contain,
  //         ),
  //         const SizedBox(
  //           width: 4,
  //         ),
  //         Text(
  //           judul,
  //           style: const TextStyle(
  //             fontWeight: FontWeight.w400,
  //             color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
                accountEmail: TextButtonWOutline(
                  text: StringClass.PENGATURAN_AKUN_TEXT,
                  icon: 'assets/icons/icon_setting.png',
                  icon2: "",
                  determineAction: "GoToRubrikPage",
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
                        buildTextButtonWOIcon(
                          StringClass.DAFTAR_TEXT,
                          ColorClass.BLACK_OUTLINE_AVATAR,
                          Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        buildTextButtonWOIcon(
                          StringClass.MASUK_TEXT,
                          Colors.white,
                          ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                        ),
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

class TextButtonWOutline extends StatelessWidget {
  TextButtonWOutline(
      {required this.icon,
      required this.icon2,
      required this.text,
      required this.determineAction});

  final String text;
  final String icon;
  final String icon2;
  final String determineAction;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (determineAction == "GoToRubrikPage") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Rubrik(),
            ),
          );
        } else if (determineAction == "PoppingOutBottomSheet") {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: new Icon(Icons.photo),
                    title: new Text('Photo'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.videocam),
                    title: new Text('Video'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.share),
                    title: new Text('Share'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        }
      },
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
                  icon,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                  ),
                ),
                if (icon2 != "") ...[
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Image.asset(
                        icon2,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildTextButton extends StatelessWidget {
  const BuildTextButton({
    Key? key,
    required this.iconFile,
    required this.judul,
  }) : super(key: key);

  final String iconFile;
  final String judul;

  @override
  Widget build(BuildContext context) {
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
}
