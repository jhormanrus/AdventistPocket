import 'dart:convert';

List<Book> booksFromJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String booksToJson(List<Book> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  Book({
    required this.id,
    required this.abbreviation,
    required this.name,
    required this.nameLong,
  });

  String id;
  String abbreviation;
  String name;
  String nameLong;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        abbreviation: json['abbreviation'],
        name: json['name'],
        nameLong: json['nameLong'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'abbreviation': abbreviation,
        'name': name,
        'nameLong': nameLong,
      };
}
