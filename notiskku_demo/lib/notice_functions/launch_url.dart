import 'package:url_launcher/url_launcher.dart';

class LaunchUrlService {
  // URL을 여는 함수
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      print("launch success\n");
    } else {
      print("Could not launch, invalid URL: $url");
      throw 'Could not launch $url';
    }
  }
}
