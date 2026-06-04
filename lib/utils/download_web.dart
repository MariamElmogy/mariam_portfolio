import 'package:web/web.dart' as web;
import 'url_launcher_helper.dart';

Future<void> downloadFile(String url) async {
  try {
    web.HTMLAnchorElement()
      ..href = url
      ..setAttribute('download', url.split('/').last)
      ..click();
  } catch (e) {
    await launchLink(url);
  }
}
