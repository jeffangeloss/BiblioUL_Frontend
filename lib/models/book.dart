// lib/models/book.dart

import 'publisher.dart';
import 'author.dart';
import 'genre.dart';

class Book {
  final int id;
  final String title;
  final String isbn;
  final int pages;
  final int publicationYear;
  final int editionYear;
  final String synopsis;
  final String coverImage;
  final String? pdfUrl;

  final Publisher publisher;
  final List<Author> authors;
  final List<Genre> genres;

  Book({
    required this.id,
    required this.title,
    required this.isbn,
    required this.pages,
    required this.publicationYear,
    required this.editionYear,
    required this.synopsis,
    required this.coverImage,
    required this.pdfUrl,
    required this.publisher,
    required this.authors,
    required this.genres,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      isbn: json['isbn'] as String,
      pages: json['pages'] as int,
      publicationYear: json['publication_year'] as int,
      editionYear: json['edition_year'] as int,
      synopsis: json['synopsis'] as String,
      coverImage: json['cover_image'] as String,
      pdfUrl: json['pdf_url'] as String?,
      publisher: Publisher.fromJson(
        json['publisher'] as Map<String, dynamic>,
      ),
      authors: (json['authors'] as List<dynamic>? ?? [])
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>? ?? [])
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isbn': isbn,
      'pages': pages,
      'publication_year': publicationYear,
      'edition_year': editionYear,
      'synopsis': synopsis,
      'cover_image': coverImage,
      'pdf_url': pdfUrl,
      'publisher': publisher.toJson(),
      'authors': authors.map((e) => e.toJson()).toList(),
      'genders': genres.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return '''
Book(
  id: $id,
  title: $title,
  isbn: $isbn,
  pages: $pages,
  publicationYear: $publicationYear,
  editionYear: $editionYear,
  synopsis: $synopsis,
  coverImage: $coverImage,
  pdfUrl: $pdfUrl,
  publisher: $publisher,
  authors: ${authors.map((a) => a.toString()).join(', ')},
  genres: ${genres.map((g) => g.toString()).join(', ')}
)
''';
  }
}
