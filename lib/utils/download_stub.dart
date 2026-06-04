import 'url_launcher_helper.dart';

Future<void> downloadFile(String url) async {
  // Fallback to opening the URL on non-web platforms
  await launchLink(url);
}
