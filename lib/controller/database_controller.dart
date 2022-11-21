import 'package:ecommerce/services/firestore.dart';

import '../models/product_model.dart';

abstract class Database {
  Stream<List<Product>> productsStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreServices.instance;

  @override
  Stream<List<Product>> productsStream() {
    return _service.collectionsStream(
      path: 'eco_products',
      builder: (data, documentId) => Product.fromMap(data!, documentId),
    );
  }
}
