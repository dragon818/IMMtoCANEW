import 'package:firebase_database/firebase_database.dart';
import 'models/ListDetails.dart';

class DetailStreamPublisher {
  final _database = FirebaseDatabase.instance.reference();

  Stream<List<ListDetails>> getListDetailStream(String path) {
    final listDetailStream = _database.child(path).onValue;
    final streamToPublish = listDetailStream.map((event) {
      final detailMapList = List.from(event.snapshot.value);
      final detailList = detailMapList.map((e) {
        return ListDetails.fromRTDB(Map<String, dynamic>.from(e));
      }).toList();
      return detailList;
    });

    return streamToPublish;
  }
}
