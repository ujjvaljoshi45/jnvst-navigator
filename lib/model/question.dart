class Question {
  String questionText;
  List<dynamic> options;
  int correctIndex;

  Question(
      {required this.questionText,
      required this.options,
      required this.correctIndex});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionText': questionText,
      'options': options,
      'correctIndex': correctIndex,
    };
  }

  Question.fromMap(Map<String, dynamic> item)
      : questionText = item['questionText'],
        options = item['options'],
        correctIndex = item['correctIndex'];
}
