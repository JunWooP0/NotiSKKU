enum Defined {
  user,
  devleoper,
}

class Keyword {
  const Keyword({
    required this.keyword,
    required this.defined,
  });

  final String keyword;
  final Defined defined;
}
