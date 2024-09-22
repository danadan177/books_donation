import 'package:books_donation/book.dart';

extension BooksListExtension on List<Book> {
  List<Book> filterByAuthor(String author) => where(
        (book) => book.authors.contains(author),
      ).toList();

  List<Book> filterByCategory(String category) => where(
        (book) => book.category == category,
      ).toList();
}
