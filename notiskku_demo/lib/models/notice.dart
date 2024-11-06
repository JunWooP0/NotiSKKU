import 'dart:convert';

class Notice {
  final String title;
  final String url;
  final String date;
  final String views;

  Notice({
    required this.title,
    required this.url,
    required this.date,
    required this.views,
  });

  // JSON으로 변환
  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'date': date,
        'views': views,
      };

  // JSON에서 Notice 객체로 변환
  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'],
      url: json['url'],
      date: json['date'],
      views: json['views'],
    );
  }
}