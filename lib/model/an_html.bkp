// part of 'package:an_app_vone/model/an_response.g.dart';

enum ElementHtml {
  beginHtml,
  beginHead,
  beginImage,
  srcImage,
  endImage,
  beginTitle,
  htmlTitle,
  endTitle,
  endHead,
  beginBody,
  beginHeader,
  htmlHeader,
  endHeader,
  beginContent,
  htmlContent,
  endContent,
  beginFooter,
  htmlFooter,
  endFooter,
  endBody,
  endHtml
}


class HtmlElement {
  final String headerFontSize = '48px';
  final String paragraphFontSize = '28px';
  final String srcImage;
  final String htmlHeader;
  String htmlContent;
  final String htmlFooter;

  List<String> elements = [
    '<!DOCTYPE html>\n<html lang="en">',
    '\n<head>',
    '\n<img align="middle" src="',
    '',
    '" width="960">',
    '\n<title>',
    'Antara News',
    '\n</title>',
    '\n</head>',
    '\n<body>',
    '\n<h1 style="font-size:48px;">',
    '\n',
    '</h1>',
    '\n<p style="font-size:32px;">',
    '\n',
    '</p>',
    '\n<footer>\n',
    '\n',
    '\n</footer>',
    '\n</body>',
    '\n</html>'
  ];

  HtmlElement(this.srcImage, this.htmlHeader, this.htmlContent, this.htmlFooter);

  String getHtmlText() {
    elements[ElementHtml.srcImage.index] = srcImage;
    elements[ElementHtml.htmlHeader.index] += htmlHeader;

    // elements[ElementHtml.htmlContent.index] += htmlContent;
    // check if source content consists paragraph tags and clean if any
    elements[ElementHtml.htmlContent.index] += _checkCleanPrefixTags(htmlContent);

    elements[ElementHtml.htmlFooter.index] += htmlFooter;
    return _composeHtml(elements);
  }

  String _composeHtml(List<String> list) {
    String composed = '';
    for (String element in list) {
      composed += element;
    }
    return composed;
  }

  String _checkCleanPrefixTags(String html) {
    html = html.replaceAll(RegExp(r'<p>'), '');
    html = html.replaceAll(RegExp(r'<p dir="ltr">'), '');
    html = html.replaceAll(RegExp(r'</p>'), '');
    html = html.replaceAll(RegExp(r'<b>'), '');
    html = html.replaceAll(RegExp(r'</b>'), '');
    html = html.replaceAll(RegExp(r'<div>'), '');
    html = html.replaceAll(RegExp(r'</div>'), '');

    // pending: find a way to change hyperlink become active text widget to invoke such WebView to display a url !!!
    // find '<a href='

    // print(html);
    return html;
  }
}
