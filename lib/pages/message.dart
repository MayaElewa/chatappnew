import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/widgets/const.dart';

class Messages {
  final String message;
  final DateTime createdAt;
  final String id;

  Messages({required this.message, required this.createdAt, required this.id});

  // Convert Firestore document into a Message object
  factory Messages.fromJson(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    

      final String text =
        (data[kMessage] is String) ? data[kMessage] as String
      : (data['messages'] is String) ? data['messages'] as String
      : '';

    final DateTime created =
        (data[kCreatedAt] is Timestamp)
            ? (data[kCreatedAt] as Timestamp).toDate()
            : DateTime.now();

    return Messages(
      message: text,
      createdAt: created,
      id: (data[kId] ?? '') as String,
    );
  }
}
