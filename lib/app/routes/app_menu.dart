// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import './app_pages.dart';


const int GetNewsLimit = 21;

// Intialization in case common page applied
AppTopik anTopik = AppTopik.Berita;
PageTopik anPageState = PageTopik(anTopik);
String anRouteTopik = Routes.HOME;
bool anSingleNewsView = false;

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

List<String> TopikCategory = const [
  "Berita",
  "Ekonomi",
  "Sport",
  "Bola",
  "Lifestyle",
  "Foto",
  "Video",
  "Infografik",
  "English",
  "More",
  "Login",
  "Profile"
];

Map<String,Color> anTabBarColor = {
  'Berita': Color.fromARGB(0xFF, 0xA3, 0x09, 0x30),
  'Ekonomi': Color.fromARGB(0xFF, 0x52, 0x50, 0xD2),
  'Sport': Color.fromARGB(0xFF, 0xED, 0x87, 0x69),
  'Bola': Color.fromARGB(0xFF, 0x47, 0x6B, 0x7A),
  'Lifestyle': Color.fromARGB(0xFF, 0x08, 0x8F, 0xFA),
  'Foto': Color.fromARGB(0xFF, 0x7E, 0xA8, 0x29),
  'Video': Color.fromARGB(0xFF, 0x9F, 0x49, 0xBD),
  'Infografik': Color.fromARGB(0xFF, 0xE1, 0xAF, 0x2F),
  'More': Color.fromARGB(0xFF, 0x5B, 0x75, 0x86),
};


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
      // "Top News",
      "Indonesia Terkini",
      "Kilas Nusantara",
      "Kabar Dunia",
      "Podcast",
      "Featured",
      "International Corner",
      "30 Menit",
      "Antarakita",
      "Lifestyle",
      "Sport Arena"
    ],
    ["Infografik", /*"Reserved"*/],
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
      // "Antarakita",
      // "Podcast",
      "Antara Iteraktif",
      "Anti Hoaks",
      "Jobs",
      "Artikel",
      "Rilis Pers"
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
      // "Top News",
      "Indonesia Terkini",
      "Kilas Nusantara",
      "Kabar Dunia",
      "Podcast",
      "Featured",
      "International Corner",
      "30 Menit",
      "Antarakita",
      "Lifestyle",
      "Sport Arena"
    ],
    ["Infografik",/* "Reserved"*/],
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
      // "Antarakita",
      // "Podcast",
      "Antara Iteraktif",
      "Anti Hoaks",
      "Jobs",
      "Artikel",
      "Rilis Pers"
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
}
