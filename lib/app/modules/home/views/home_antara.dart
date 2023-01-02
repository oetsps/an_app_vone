import 'package:an_app_vone/app/modules/resource/color.dart';
import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorClass.BROKEN_WHITE_APPBAR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            Image.asset('assets/images/text_antara_appbar.png',
                fit: BoxFit.cover),
          ],
        ),
      ),
      // body: Padding(
      body: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {},
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('Item 1'),
                    );
                  },
                  body: ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(1.0),
                      width: 30,
                      child: const Text('Bije'),
                    ),
                    title: Text('Item 1 child'),
                    subtitle: Text('Details goes here'),
                  ),
                  isExpanded: true,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('Item 2'),
                    );
                  },
                  body: ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(1.0),
                      width: 30,
                      child: const Text('Bije'),
                    ),
                    title: Text('Item 2 child'),
                    subtitle: Text('Details goes here'),
                  ),
                  isExpanded: true,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
                children: [Text("TEST1"), Text("TEST2")],
            ),
          ),
        ],
      ),
    );
  }
}


// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorClass.BROKEN_WHITE_APPBAR,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/logo.png', fit: BoxFit.cover),
//             Image.asset('assets/images/text_antara_appbar.png',
//                 fit: BoxFit.cover),
//           ],
//         ),
//       ),
//       // body: Padding(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//         child: Column(
//           children: [
//             Container(
//               height: 52,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       width: 20,
//                       child: Text(
//                         'MASIH HARDCODE',
//                         // textAlign: TextAlign.center,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             background: Paint()
//                               ..color = ColorClass.GREY_BUTTON
//                               ..strokeWidth = 8
//                               ..strokeJoin = StrokeJoin.round
//                               ..strokeCap = StrokeCap.round
//                               ..style = PaintingStyle.stroke,
//                             color: ColorClass.BLACK_TEXT,
//                             fontSize: 11.0),
//                       ),
//                     ),
//                   ),
//                   // ExpansionPanelList(
//                   //   expansionCallback: (int index, bool isExpanded) {},
//                   //   children: [
//                   //     ExpansionPanel(
//                   //       headerBuilder: (BuildContext context, bool isExpanded) {
//                   //         return ListTile(
//                   //           title: Text('Item 1'),
//                   //         );
//                   //       },
//                   //       body: ListTile(
//                   //         title: Text('Item 1 child'),
//                   //         subtitle: Text('Details goes here'),
//                   //       ),
//                   //       isExpanded: true,
//                   //     ),
//                   //     ExpansionPanel(
//                   //       headerBuilder: (BuildContext context, bool isExpanded) {
//                   //         return ListTile(
//                   //           title: Text('Item 2'),
//                   //         );
//                   //       },
//                   //       body: ListTile(
//                   //         title: Text('Item 2 child'),
//                   //         subtitle: Text('Details goes here'),
//                   //       ),
//                   //       isExpanded: false,
//                   //     ),
//                   //   ],
//                   // )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [Text("TEST1"), Text("TEST2")],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
