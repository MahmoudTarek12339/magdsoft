class HelpResponseModel {
  int? id;
  String? question;
  String? answer;

  HelpResponseModel(this.id, this.question, this.answer);

  HelpResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}
