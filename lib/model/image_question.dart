class ImageQuestion {
  String questionImage;
  String option1Image;
  String option2Image;
  String option3Image;
  String option4Image;
  int correctIndex;
  ImageQuestion(
      {required this.questionImage,
      required this.option1Image,
      required this.option2Image,
      required this.option3Image,
      required this.option4Image,
      required this.correctIndex});

  ImageQuestion.fromMap(Map<String, dynamic> item)
      : questionImage = item['question'],
        option1Image = item['option1'],
        option2Image = item['option2'],
        option3Image = item['option3'],
        option4Image = item['option4'],
        correctIndex = item['correctOption'] as int;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': questionImage,
      'option1': option1Image,
      'option2': option2Image,
      'option3': option3Image,
      'option4': option4Image,
      'correctOption': correctIndex.toString(),
    };
  }
}
