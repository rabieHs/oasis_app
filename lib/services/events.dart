import 'package:cloud_firestore/cloud_firestore.dart';

class EventsServices {
  Future<List<Map>> getEvents() async {
    final result = await FirebaseFirestore.instance.collection('events').get();
    final docs = result.docs;

    return docs.map((doc) {
      return doc.data();
    }).toList();
  }
}


/// map