import 'dart:html' as html;
import 'url_launcher_helper.dart';

Future<void> downloadFile(String url) async {
  try {
     html.AnchorElement(href: url)
      ..setAttribute('download', url.split('/').last)
      ..click();
  } catch (e) {
    // Fallback if something goes wrong
    await launchLink(url);
  }
}
