import 'package:an_app_vone/app/modules/rubrik/rubrik_antara.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                accountEmail: TextButtonWOutline2(
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

class TextButtonWOutline2 extends StatefulWidget {
  const TextButtonWOutline2(
      {required this.icon,
      required this.icon2,
      required this.text,
      required this.determineAction});

  final String text;
  final String icon;
  final String icon2;
  final String determineAction;

  @override
  State<TextButtonWOutline2> createState() => _TextButtonWOutline2State();
}

class _TextButtonWOutline2State extends State<TextButtonWOutline2> {
  List selectedIndexList = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return TextButton(
      onPressed: () {
        if (widget.determineAction == "GoToRubrikPage") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Rubrik(),
            ),
          );
        } else if (widget.determineAction == "PoppingOutBottomSheet") {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListTile(
                    title: Text(
                      StringClass.FILTER_TEXT,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorClass.BLACK_TEXT,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      StringClass.URUTKAN_TEXT,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorClass.BLACK_TEXT,
                      ),
                    ),
                  ),
                  ListTile(
                    title: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      childAspectRatio: (itemWidth / itemHeight) * 4,
                      children: List.generate(
                        filter.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedIndexList.contains(index)) {
                                  selectedIndexList.remove(index);
                                } else {
                                  selectedIndexList.add(index);
                                }
                                print("check value selectedIndexList: $selectedIndexList");
                              });
                            },
                            child: SelectCardFilter(
                              filter: filter[index],
                              selectedIndex: index,
                              selectedList: selectedIndexList,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      StringClass.NUSANTARA_TEXT,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorClass.BLACK_TEXT,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 5,
                          childAspectRatio: (itemWidth / itemHeight) * 4,
                          children: List.generate(
                            filterDaerah.length,
                            (index) {
                              return GestureDetector(
                                  // child: SelectCardFilter(
                                  //   filter: filterDaerah[index],
                                  // ),
                                  // onTap: () {
                                  //   setState(() {
                                  //
                                  //   });
                                  // },
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: ColorClass.BLACK_TEXT_2),
                      child: Text(
                        StringClass.TAMPILKAN_HASIL_TEXT,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                  widget.icon,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ColorClass.BLACK_BUTTON_BACKGROUND_COLOR,
                  ),
                ),
                if (widget.icon2 != "") ...[
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Image.asset(
                        widget.icon2,
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

class Filter {
  const Filter({this.title});
  final String? title;
}

List<Filter> filter = <Filter>[
  Filter(title: StringClass.TERBARU_TEXT),
  Filter(title: StringClass.TERLAMA_TEXT),
  Filter(title: StringClass.PALING_BANYAK_DIBACA_TEXT),
  Filter(title: StringClass.PALING_BANYAK_DISUKAI_TEXT),
];

class FilterDaerah {
  const FilterDaerah({this.title});
  final String? title;
}

List<FilterDaerah> filterDaerah = <FilterDaerah>[
  FilterDaerah(title: StringClass.SEMUA_TEXT),
  FilterDaerah(title: StringClass.ACEH_TEXT),
  FilterDaerah(title: StringClass.BALI_TEXT),
  FilterDaerah(title: StringClass.BANGKA_TEXT),
  FilterDaerah(title: StringClass.BANTEN_TEXT),
  FilterDaerah(title: StringClass.BENGKULU_TEXT),
  FilterDaerah(title: StringClass.GORONTALO_TEXT),
  FilterDaerah(title: StringClass.JAMBI_TEXT),
  FilterDaerah(title: StringClass.JAWABARAT_TEXT),
  FilterDaerah(title: StringClass.JAWATENGAH_TEXT),
  FilterDaerah(title: StringClass.JAWATIMUR_TEXT),
  FilterDaerah(title: StringClass.KALIMANTANBARAT_TEXT),
  FilterDaerah(title: StringClass.KALIMANTANSELATAN_TEXT),
  FilterDaerah(title: StringClass.KALIMANTANTENGAH_TEXT),
  FilterDaerah(title: StringClass.KALIMANTANTIMUR_TEXT),
];

class SelectCardFilter extends StatelessWidget {
  const SelectCardFilter(
      {Key? key, required this.filter,
       required this.selectedIndex,
       required this.selectedList})
      : super(key: key);
  final dynamic filter;
  final int selectedIndex;
  final List selectedList;

  @override
  Widget build(BuildContext context) {
    print("checki checki beibih : $selectedList");
    return Card(
      elevation: 0,
      // color: Colors.white,
      color: selectedList.contains(selectedIndex) ? Colors.black : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: BorderSide(
          // color: Colors.black,
          color: selectedList.contains(selectedIndex)
              ? Colors.white
              : Colors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              filter.title ?? "",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
