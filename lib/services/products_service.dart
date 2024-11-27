import 'package:dio/dio.dart';
import 'package:store/models/product.dart';

class ProductsService {
  final String url = "http://51.21.128.246/api/products";
  final dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      Response response = await dio.get(url);
      List<dynamic> jsonData = response.data;
      List<Product> productList = [];
      for (var e in jsonData) {
        Product product = Product.fromJson(e);
        productList.add(product);
      }
      return productList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
