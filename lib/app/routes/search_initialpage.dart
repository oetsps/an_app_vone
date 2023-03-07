import 'dart:convert';

import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:an_app_vone/app/routes/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../data/mockdata/dummy.dart';
import '../modules/berita/views/berita_news_chain.dart';
import '../modules/resource/color.dart';

class SearchInitialPage extends StatefulWidget {
  const SearchInitialPage({Key? key}) : super(key: key);

  @override
  State<SearchInitialPage> createState() => _SearchInitialPageState();
}

class _SearchInitialPageState extends State<SearchInitialPage> {
  var tags = [
    "Siap Bantu UMKM",
    "G20 Indonesia",
    "PPKM",
    "Vaksin Covid",
    "Gernas BBI",
    "Covid-19",
    "Blackpink Jakarta"
  ];
  var selected_tags = [];

  var dummySearchHistory = [
    "Blackpink Indonesia",
    "Destinasi Yogyakarta",
    "Piala Dunia Argentina",
    "Jadwal Liga 1",
    "Kebakaran data center"
  ];
  final TextEditingController searchText = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchText.dispose();
    super.dispose();
  }

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
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.white,
                  width: 0.0,
                ),
              ),
              child: TextField(
                controller: searchText,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: "Ketik keyword berita yang mau kamu cari...",
                  contentPadding: const EdgeInsets.all(16),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Image.asset("assets/images/icon_vector.png"),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(
                            searchText: searchText.text,
                          ),
                        ),
                      )
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shrinkWrap: true,
                    children: [
                      Text(
                        StringClass.PALING_BANYAK_DICARI,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: <Widget>[...generate_search()],
                      ),
                      Text(
                        StringClass.RIWAYAT_PENCARIAN,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListTile(
                      leading: const Icon(Icons.search),
                      title: Text(dummySearchHistory[index]),
                    ),
                  );
                },
                itemCount: dummySearchHistory.length,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    StringClass.LIHAT_BERITA_POPULER,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: List.generate(4, (index) {
                  return Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.network(
                              Dummy.get_news[index]['photo_medium'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            jsonEncode(Dummy.get_news[index]
                                                    ['title'])
                                                .replaceAll("\"", ""),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                jsonEncode(Dummy.get_news[index]
                                                        ['category'])
                                                    .replaceAll("\"", ""),
                                                style: const TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Image.asset(
                                                'assets/icons/ic_heart.png',
                                                fit: BoxFit.contain,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(width: 4),
                                              Image.asset(
                                                'assets/icons/ic_chat.png',
                                                fit: BoxFit.contain,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(width: 4),
                                              Image.asset(
                                                'assets/icons/ic_send.png',
                                                fit: BoxFit.contain,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                                size: 14,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '17 Menit',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  generate_search() {
    return tags.map((tag) => get_search(tag)).toList();
  }

  get_search(name) {
    return FilterChip(
      selected: selected_tags.contains(name),
      selectedColor: Colors.black,
      disabledColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      labelStyle: selected_tags.contains(name)
          ? const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10)
          : const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
      label: Text("$name"),
      onSelected: (bool value) {
        setState(() {
          if (selected_tags.contains(name)) {
            selected_tags.remove(name);
          } else {
            selected_tags.add(name);
          }
        });
      },
    );
  }
}
