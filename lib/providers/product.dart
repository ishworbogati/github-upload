import 'package:flutter/material.dart';

import '../helpers/product.dart';
import '../models/products.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> allProducts = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByRestaurant = [];
  List<ProductModel> productsSearched = [];
  List<ProductModel> listproduct = [];

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future loadAllProducts({String productName}) async {
    allProducts = await _productServices.getAllProducts(category: productName);
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

//  likeDislikeProduct({String userId, ProductModel product, bool liked})async{
//    if(liked){
//      if(product.userLikes.remove(userId)){
//        _productServices.likeOrDislikeProduct(id: product.id, userLikes: product.userLikes);
//      }else{
//        print("THE USER WA NOT REMOVED");
//      }
//    }else{
//
//      product.userLikes.add(userId);
//        _productServices.likeOrDislikeProduct(id: product.id, userLikes: product.userLikes);
//
//
//      }
//  }

  Future search({String productName}) async {
    productsSearched =
        await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
