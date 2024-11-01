class Notice {
  final String title;
  final String url;
  final String date;
  final String views; // 조회수 필드 추가

  Notice(
      {required this.title,
      required this.url,
      required this.date,
      required this.views});
}