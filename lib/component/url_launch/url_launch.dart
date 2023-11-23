import 'package:url_launcher/url_launcher.dart';

import '../../constant/url/app_api_url.dart';

Future<void> launchWebPageUrl() async {
  String url=AppWebUrl.WEB_URL;
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
Future<void> launchConditionsWebPageUrl() async {
  String url=AppWebUrl.WEB_CONDITIONS_URL;
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Future<void> launchPolicyWebPageUrl() async {
  String url=AppWebUrl.WEB_POLICY_URL;
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}