import '../utilities/app_assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final int oldPrice;
  final String imgUrl;
  final int discountValue;
  final String category;
  final int? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.imgUrl,
    this.discountValue = 0,
    this.category = 'Other',
    this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'oldPrice': oldPrice,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'category': category,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      oldPrice: map['oldPrice'] as int,
      imgUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
      rate: map['rate'] as int,
    );
  }
}

List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'T-shirt',
    price: 15,
    imgUrl: AppAssets.fashion,
    category: 'Clothes',
    discountValue: 20,
    oldPrice: 35,
  ),
/*  Product(
    id: '1',
    title: 'T-shirt',
    price: 15,
    imgUrl: AppAssets.fashion,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 15,
    imgUrl: AppAssets.fashion,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 15,
    imgUrl: AppAssets.fashion,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 15,
    imgUrl: AppAssets.fashion,
    category: 'Clothes',
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 15,
    imgUrl: AppAssets.fashion,
    category: 'Clothes',
    discountValue: 20,
  ),*/
];
