import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(jsonDecode(str));

class Data {
  List<Result> results;
  Data({required this.results});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Result> resultList = list.map((e) => Result.fromJson(e)).toList();
    return Data(
        results:
            List<Result>.from(json['results'].map((e) => Result.fromJson(e))));
  }
}

class Result {
  String question;
  String correctAnswer;
  List<String> answer;

  Result({
    required this.question,
    required this.correctAnswer,
    required this.answer,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      answer: List<String>.from(json['incorrect_answers'])
        ..add(json['correct_answer'])
        ..shuffle());
}
