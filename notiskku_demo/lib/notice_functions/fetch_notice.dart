import 'package:http/http.dart' as http; // http 요청을 위한 패키지
import 'package:html/parser.dart' as parser; // HTML 파싱을 위한 패키지
import 'package:notiskku_demo/models/notice.dart'; // Notice 클래스의 경로

class NoticeService {
  Future<List<Notice>> fetchNotices(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);

      List<Notice> notices = [];
      
      if (url.contains('cse.skku.edu')) {
        // 소프트웨어학과 공지사항 구조 파싱
        var noticeElements = document.querySelectorAll('dt.board-list-content-title a');
        var infoElements = document.querySelectorAll('dd.board-list-content-info ul');

        for (int i = 0; i < noticeElements.length; i++) {
          var element = noticeElements[i];
          var infoElement = infoElements[i];

          String title = element.text.trim();
          String relativeUrl = element.attributes['href'] ?? '';
          String fullUrl = Uri.parse(url).resolve(relativeUrl).toString();

          String date = infoElement.querySelectorAll('li')[2].text.trim();
          String views = infoElement.querySelectorAll('li')[3].text.trim().replaceAll('조회수', '').trim();

          notices.add(Notice(title: title, url: fullUrl, date: date, views: views));
        }

      } else if (url.contains('sw.skku.edu')) {
        // 소프트웨어융합대학 공지사항 구조 파싱
        var noticeElements = document.querySelectorAll('dt.board-list-content-title a');
        var infoElements = document.querySelectorAll('dd.board-list-content-info ul');

        for (int i = 0; i < noticeElements.length; i++) {
          var element = noticeElements[i];
          var infoElement = infoElements[i];

          String title = element.text.trim();
          String relativeUrl = element.attributes['href'] ?? '';
          String fullUrl = Uri.parse(url).resolve(relativeUrl).toString();

          String date = infoElement.querySelectorAll('li')[2].text.trim();
          String views = infoElement.querySelectorAll('li')[3].text.trim().replaceAll('조회수', '').trim();

          notices.add(Notice(title: title, url: fullUrl, date: date, views: views));
        }

      } else {
        // 기본 메인홈 공지사항 구조 파싱
        var noticeElements = document.querySelectorAll('dt.board-list-content-title a');
        var infoElements = document.querySelectorAll('dd.board-list-content-info ul');

        for (int i = 0; i < noticeElements.length; i++) {
          var element = noticeElements[i];
          var infoElement = infoElements[i];

          String title = element.text.trim();
          String relativeUrl = element.attributes['href'] ?? '';
          String fullUrl = Uri.parse('https://www.skku.edu/skku/campus/skk_comm/notice01.do').resolve(relativeUrl).toString();

          String date = infoElement.querySelectorAll('li')[2].text.trim();
          String views = infoElement.querySelectorAll('li')[3].text.trim().replaceAll('조회수', '').trim();

          notices.add(Notice(title: title, url: fullUrl, date: date, views: views));
        }
      }

      return notices;
    } else {
      throw Exception('Failed to load notices');
    }
  }
}
