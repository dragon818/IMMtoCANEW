class QuestionAndAnswer {
  String question;
  String answer;

  QuestionAndAnswer(
    this.question,
    this.answer,
  );

  factory QuestionAndAnswer.fromRTDB(Map<String, dynamic> data) {
    return QuestionAndAnswer(
      data['question'],
      data['answer'],
    );
  }
}
