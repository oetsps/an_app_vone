// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import './app_pages.dart';

bool userLog = false;
// String currentTopik = '';
// String currentSubTopik = '';

enum AppTopik {
  Berita,
  Ekonomi,
  Sport,
  Bola,
  Lifestyle,
  Foto,
  Video,
  Infografik,
  English,
  More,
  Login,
  Profile
}

const int PageNumber = 11;

List<List<String>> menuSubTopik = const [
    ["Berita", "Politik", "Hukum", "Metro", "Humaniora", /*"Nusantara",*/ "Dunia"],
    [
      "Ekonomi",
      "Bisnis",
      // "Property",
      // "Infrastruktur",
      // "Syariah",
      // "Industry",
      "Bursa",
      // "UMKM",
      "Finansial",
      "BUMN"
    ],
    ["Sport", /*"All Sport", */"Otosport", "Bulutangkis", "Sportainment", "E-Sport"],
    ["Bola", "Indonesia", "Liga Inggris", "Liga Champions", "Internasional"],
    [
      "Lifestyle",
      "Hiburan",
      "Otomotif",
      "Travel",
      "Health",
      "Parenting",
      "Fashion",
      "Kuliner",
      "Beauty",
      "Spiritualism",
      "Tekno"
    ],
    ["Foto", "Foto Hardnews", "Photo Stories"],
    [
      "Video",
      "Top News",
      "Indonesia Terkini",
      "Kilas Nusantara",
      "Kabar Dunia",
      "Podcast",
      "Feature",
      "Int`l Corner",
      "30 Menit",
      "Antarakita",
      "Lifestyle",
      "Sport Antara"
    ],
    ["Infografik", "Reserved"],
    [
      "English",
      "Current Issue",
      "World",
      "Business",
      "Indonesia",
      "Article",
      "Photo",
      "Press Release",
      "Infografik",
      "Link Bahasa"
    ],
    [
      "More",
      "Komunitas",
      "Antarakita",
      "Podcast",
      "Antara Iteraktif",
      "Anti Hoaks",
      "Jobs",
      "Artikel"
    ],
    ["Login"],
    [
      "Profile",
      "Favorites",
      "Friends",
      "Share",
      "Request",
      "Setting",
      "Policies",
      "Home",
      "Exit"
    ]
];

class PageTopik {
  final AppTopik topik;
  // String currentSubTopik = '';
  final List<List<String>> subTopik = const [
    ["Berita", "Politik", "Hukum", "Metro", "Humaniora", /*"Nusantara",*/ "Dunia"],
    [
      "Ekonomi",
      "Bisnis",
      // "Property",
      // "Infrastruktur",
      // "Syariah",
      // "Industry",
      "Bursa",
      // "UMKM",
      "Finansial",
      "BUMN"
    ],
    ["Sport", /*"All Sport", */"Otosport", "Bulutangkis", "Sportainment", "E-Sport"],
    ["Bola", "Indonesia", "Liga Inggris", "Liga Champions", "Internasional"],
    [
      "Lifestyle",
      "Hiburan",
      "Otomotif",
      "Travel",
      "Health",
      "Parenting",
      "Fashion",
      "Kuliner",
      "Beauty",
      "Spiritualism",
      "Tekno"
    ],
    ["Foto", "Foto Hardnews", "Photo Stories"],
    [
      "Video",
      "Top News",
      "Indonesia Terkini",
      "Kilas Nusantara",
      "Kabar Dunia",
      "Podcast",
      "Feature",
      "Int`l Corner",
      "30 Menit",
      "Antarakita",
      "Lifestyle",
      "Sport Antara"
    ],
    ["Infografik", "Reserved"],
    [
      "English",
      "Current Issue",
      "World",
      "Business",
      "Indonesia",
      "Article",
      "Photo",
      "Press Release",
      "Infografik",
      "Link Bahasa"
    ],
    [
      "More",
      "Komunitas",
      "Antarakita",
      "Podcast",
      "Antara Iteraktif",
      "Anti Hoaks",
      "Jobs",
      "Artikel"
    ],
    ["Login"],
    [
      "Profile",
      "Favorites",
      "Friends",
      "Share",
      "Request",
      "Setting",
      "Policies",
      "Home",
      "Exit"
    ]
  ];

  PageTopik(this.topik);

  int getTopikIndex() {
    return topik.index;
  }

  String getName() {
    return topik.name;
  }

  List<String> getSubTopik() {
    return subTopik[topik.index].toList();
  }

  int subTopikLength() {
    return subTopik[topik.index].length;
  }

  AppTopik getPageTopikState() {
    return topik;
  }

  // String getPageSubTopikState() {
  //   return currentSubTopik;
  // }

  // void setPageTopikState(AppTopik topik) {
  //   topik = topik;
  // }

  // String setPageSubTopikState(int index) {
  //   return currentSubTopik = subTopik[topik.index][index];
  // }
}

const List<PopupMenuEntry<String>> popupMenu = [
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.HOME,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.home,
        color: Colors.black,
      ),
      title: Text(
        'Berita',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.BISNIS,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.business,
        color: Colors.black,
      ),
      title: Text(
        'Bisnis',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.SPORT,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.sports,
        color: Colors.black,
      ),
      title: Text(
        'Sport',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.BOLA,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.sports_soccer,
        color: Colors.black,
      ),
      title: Text(
        'Bola',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.LIFESTYLE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.living,
        color: Colors.black,
      ),
      title: Text(
        'Lifestyle',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.FOTO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.photo,
        color: Colors.black,
      ),
      title: Text(
        'Foto',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.VIDEO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.video_camera_front,
        color: Colors.black,
      ),
      title: Text(
        'Video',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.INFOGRAFIK,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.graphic_eq_rounded,
        color: Colors.black,
      ),
      title: Text(
        'Infografik',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.ENGLISH,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.more,
        color: Colors.black,
      ),
      title: Text(
        'English',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.MORE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.more,
        color: Colors.black,
      ),
      title: Text(
        'More',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.LOGIN,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.login,
        color: Colors.black,
      ),
      title: Text(
        'Login',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
];

const List<PopupMenuEntry<String>> popupMenuLoggedIn = [
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.HOME,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.home,
        color: Colors.black,
      ),
      title: Text(
        'Berita',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.BISNIS,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.business,
        color: Colors.black,
      ),
      title: Text(
        'Bisnis',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.SPORT,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.sports,
        color: Colors.black,
      ),
      title: Text(
        'Sport',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.BOLA,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.sports_soccer,
        color: Colors.black,
      ),
      title: Text(
        'Bola',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.LIFESTYLE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.living,
        color: Colors.black,
      ),
      title: Text(
        'Lifestyle',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.FOTO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.photo,
        color: Colors.black,
      ),
      title: Text(
        'Foto',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.VIDEO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.video_camera_front,
        color: Colors.black,
      ),
      title: Text(
        'Video',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.INFOGRAFIK,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.graphic_eq_rounded,
        color: Colors.black,
      ),
      title: Text(
        'Infografik',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.ENGLISH,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.more,
        color: Colors.black,
      ),
      title: Text(
        'English',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    value: Routes.MORE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.more,
        color: Colors.black,
      ),
      title: Text(
        'More',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(
      left: 6,
    ),
    // value: Routes.LOGIN,
    value: Routes.PROFILE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(
        Icons.person,
        color: Colors.black,
      ),
      title: Text(
        'Profile',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
];
