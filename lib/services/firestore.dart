import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreServices {
  //singleton design pattern
  FirestoreServices._();

  static final instance = FirestoreServices._();

  final _fireStore = FirebaseFirestore.instance;

  //set data to fireStore
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.doc(path).set(data);
    debugPrint('Request data: $data');
  }

  //delete data from fireStore
  Future<void> deleteData({
    required String path,
  }) async {
    await _fireStore.doc(path).delete();
  }

  // get documents
  Future<Stream<T>> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) async {
    final snapShot = _fireStore.doc(path).snapshots();
    return snapShot.map((doc) => builder(doc.data(), doc.id));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
