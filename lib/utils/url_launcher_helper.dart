import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

Future<void> launchEmail(String email) => launchLink('mailto:$email');
