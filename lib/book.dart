class Book {
  String title;
  List<String> authors;
  int pageCount;
  String category;

  Book({
    required this.title,
    required this.authors,
    required this.pageCount,
    required this.category,
  });

  factory Book.fromJson(json) {
    return Book(
      title: json['title'],
      authors: List<String>.from(json['authors']),
      pageCount: json['pageCount'],
      category: json['category'],
    );
  }
}
