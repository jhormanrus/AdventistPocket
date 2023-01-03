import 'dart:convert';

List<Verse> versesFromJson(String str) => List<Verse>.from(json.decode(str).map((x) => Verse.fromJson(x)));

String versesToJson(List<Verse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Verse {
  Verse({
    required this.id,
    required this.number,
    required this.reference,
    required this.content,
    required this.chapterId,
  });

  String id;
  String number;
  String reference;
  String content;
  String chapterId;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json['id'],
        number: json['number'],
        reference: json['reference'],
        content: json['content'],
        chapterId: json['chapterId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'reference': reference,
        'content': content,
        'chapterId': chapterId,
      };
}
