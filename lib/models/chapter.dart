import 'dart:convert';

List<Chapter> chaptersFromJson(String str) => List<Chapter>.from(json.decode(str).map((x) => Chapter.fromJson(x)));

String chaptersToJson(List<Chapter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chapter {
  Chapter({
    required this.id,
    required this.number,
    required this.reference,
    required this.bookId,
  });

  String id;
  String number;
  String reference;
  String bookId;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json['id'],
        number: json['number'],
        reference: json['reference'],
        bookId: json['bookId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'reference': reference,
        'bookId': bookId,
      };
}
