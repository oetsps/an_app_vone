
import '../modules/resource/color.dart';
import '../modules/resource/string.dart';
import 'package:flutter/material.dart';

import '../modules/rubrik/rubrik_antara.dart';

// custom bottom sheet
class CustomBottomSheetWidget extends StatefulWidget {
  const CustomBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheetWidget> createState() =>
      _CustomBottomSheetWidgetState();
}

class _CustomBottomSheetWidgetState extends State<CustomBottomSheetWidget> {
  var tags = [
    StringClass.TERBARU_TEXT,
    StringClass.TERLAMA_TEXT,
    StringClass.PALING_BANYAK_DIBACA_TEXT,
    StringClass.PALING_BANYAK_DISUKAI_TEXT,
  ];
  var selected_tags = [];

  var region = [
    StringClass.SEMUA_TEXT,
    StringClass.ACEH_TEXT,
    StringClass.BALI_TEXT,
    StringClass.BANGKA_TEXT,
    StringClass.BANTEN_TEXT,
    StringClass.BENGKULU_TEXT,
    StringClass.GORONTALO_TEXT,
    StringClass.JAMBI_TEXT,
    StringClass.JAWABARAT_TEXT,
    StringClass.JAWATENGAH_TEXT,
    StringClass.JAWATIMUR_TEXT,
    StringClass.KALIMANTANBARAT_TEXT,
    StringClass.KALIMANTANSELATAN_TEXT,
    StringClass.KALIMANTANTENGAH_TEXT,
    StringClass.KALIMANTANTIMUR_TEXT,
  ];
  var selected_region = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 24),
              child: Text(
                StringClass.FILTER_TEXT,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorClass.BLACK_TEXT,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                StringClass.URUTKAN_TEXT,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorClass.BLACK_TEXT,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: <Widget>[...generate_tags()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                StringClass.NUSANTARA_TEXT,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorClass.BLACK_TEXT,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: <Widget>[...generate_region()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: ColorClass.BLACK_TEXT_2,
                  minimumSize: const Size.fromHeight(50),
                ),
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
        ),
      ],
    );
  }

  generate_tags() {
    return tags.map((tag) => get_chip(tag)).toList();
  }

  generate_region() {
    return region.map((region) => get_chip(region)).toList();
  }

  get_chip(name) {
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

  get_chip_region(name) {
    return FilterChip(
      selected: selected_region.contains(name),
      selectedColor: Colors.black,
      disabledColor: Colors.white,
      showCheckmark: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3.0),
        ),
      ),
      labelStyle: selected_region.contains(name)
          ? const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10)
          : const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
      label: Text("$name"),
      onSelected: (bool value) {
        setState(() {
          if (selected_region.contains(name)) {
            selected_region.remove(name);
          } else {
            selected_region.add(name);
          }
        });
      },
    );
  }
}
// custom bottom sheet


// custom text button with outline
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
              return const CustomBottomSheetWidget();
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
// custom text button with outline


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