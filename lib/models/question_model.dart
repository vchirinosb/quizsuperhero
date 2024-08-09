class QuestionModel {
  final String image;
  final List<Map<String, dynamic>> options;
  final String answer;

  QuestionModel({
    required this.image,
    required this.options,
    required this.answer,
  });
}
