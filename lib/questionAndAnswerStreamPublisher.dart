// import 'package:firebase_database/firebase_database.dart';
// import 'package:immigratetocanada/models/QuestionAndAnswer.dart';

// class QusetionAndAnswerStreamPublisher {
//   final _database = FirebaseDatabase.instance.reference();

//   Stream<List<QuestionAndAnswer>> getQuestionAndAnswerStream(String path) {
//     final questionAndAnswerStream = _database.child(path).onValue;
//     final streamToPublish = questionAndAnswerStream.map((event) {
//       final questionAndAnswerMapList = List.from(event.snapshot.value);
//       final questionAndAnswer = questionAndAnswerMapList.map((e) {
//         return QuestionAndAnswer.fromRTDB(Map<String, dynamic>.from(e));
//       }).toList();
//       return questionAndAnswer;
//     });

//     return streamToPublish;
//   }
// }
