import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:test_task_SoftCent/app/modules/home/model/home_model.dart';

class ProductListAPI {

  Dio dio = Dio();

  Future<List<Products>?> getProducts() async {
    String url = 'https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9#';
    try {
      Response response = await dio.get(url);
      ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel.products;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}