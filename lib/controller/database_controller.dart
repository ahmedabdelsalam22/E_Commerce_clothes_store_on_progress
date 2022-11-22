import 'package:ecommerce/services/firestore.dart';

import '../models/product_model.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();

  Stream<List<Product>> newProductsStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreServices.instance;
  final String uid;

  FirestoreDatabase(this.uid);

  // get data that have a discount
  @override
  Stream<List<Product>> salesProductsStream() {
    return _service.collectionsStream(
      path: 'eco_products',
      builder: (data, documentId) => Product.fromMap(data!, documentId),
      queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
    );
  }

  // get all data
  @override
  Stream<List<Product>> newProductsStream() => _service.collectionsStream(
        path: 'eco_products',
        builder: (data, documentId) => Product.fromMap(data!, documentId),
      );
}
