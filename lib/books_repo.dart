import 'dart:convert';

import 'package:books_donation/book.dart';
import 'package:flutter/services.dart';

class BooksRepo {
  List<Book> books = [];

  Future<void> fetchBooks() async {
    String jsonString =
        await rootBundle.loadString('data/catalog_books.json.txt');
    List<dynamic> jsonList = jsonDecode(jsonString);
    books = jsonList.map((json) => Book.fromJson(json)).toList();
  }

  Book getBook(String name) {
    try {
      return books.firstWhere((book) => book.title == name);
    } catch (e) {
      throw Exception();
    }
  }

  List<Book> getBooksByPageCount(int pageCount) {
    return books
        .where(
          (book) => book.pageCount >= pageCount,
        )
        .toList();
  }

  Map<String, int> getAuthorthBookCount() {
    Map<String, int> authorsMap = {};
    for (Book book in books) {
      for (String author in book.authors) {
        if (authorsMap[author] != null) {
          authorsMap[author] = authorsMap[author]! + 1;
        } else {
          authorsMap[author] = 1;
        }
      }
    }
    return authorsMap;
  }
}
