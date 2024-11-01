import 'package:http/http.dart' as http; // http 요청을 위한 패키지
import 'package:html/parser.dart' as parser; // HTML 파싱을 위한 패키지
import 'package:notiskku_demo/models/notice.dart'; // Notice 클래스의 경로

class NoticeService {
  Future<List<Notice>> fetchNotices(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      var noticeElements = document.querySelectorAll('dt.board-list-content-title a');
      var infoElements = document.querySelectorAll('dd.board-list-content-info ul');

      List<Notice> notices = [];
      for (int i = 0; i < noticeElements.length; i++) {
        var element = noticeElements[i];
        var infoElement = infoElements[i];

        String title = element.text.trim();
        String relativeUrl = element.attributes['href'] ?? '';
        String fullUrl = Uri.parse('https://www.skku.edu/skku/campus/skk_comm/notice01.do').resolve(relativeUrl).toString();

        var dateElement = infoElement.querySelectorAll('li')[2];
        String date = dateElement.text.trim();

        var viewsElement = infoElement.querySelectorAll('li')[3];
        String views = viewsElement.text.trim().replaceAll('조회수', '').trim();

        notices.add(Notice(title: title, url: fullUrl, date: date, views: views));
      }

      return notices;
    } else {
      throw Exception('Failed to load notices');
    }
  }
}