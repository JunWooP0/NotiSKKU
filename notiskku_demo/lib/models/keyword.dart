enum Defined {
  user,
  developer,
}

class Keyword {
  const Keyword({
    required this.keyword,
    required this.defined,
  });

  final String keyword;
  final Defined defined;
}
