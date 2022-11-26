import 'package:ecommerce/services/firestore.dart';
import 'package:ecommerce/utilities/api_path.dart';

import '../models/product_model.dart';
import '../models/user_model.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();
  Stream<List<Product>> newProductsStream();

  Future<void> setUserData(UserDataModel userDataModel);
}

class FirestoreDatabase implements Database {
  final _service = FirestoreServices.instance;
  final String uid;

  FirestoreDatabase(this.uid);

  // get data that have a discount
  @override
  Stream<List<Product>> salesProductsStream() {
    return _service.collectionsStream(
      path: ApiPath.ecoProducts(),
      builder: (data, documentId) => Product.fromMap(data!, documentId),
      queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
    );
  }

  // get all data
  @override
  Stream<List<Product>> newProductsStream() => _service.collectionsStream(
        path: ApiPath.ecoProducts(),
        builder: (data, documentId) => Product.fromMap(data!, documentId),
      );

  @override
  Future<void> setUserData(UserDataModel userDataModel) async {
    await _service.setData(
      path: ApiPath.user(userDataModel.uid),
      data: userDataModel.toMap(),
    );
  }
}
