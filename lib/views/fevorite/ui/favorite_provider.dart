import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Map<String, dynamic>> favorites = [];

  void toggleFavorite(Map<String, dynamic> product) {
    if (favorites.any((item) => item['name'] == product['name'])) {
      favorites.removeWhere((item) => item['name'] == product['name']);
    } 
   
    else {
      favorites.add(product);
    }

      notifyListeners(); // لازم ننده عليها بعد أي تغيير
  }
}


//  
//  
//  
//  
//  
//  
// class FavoriteProvider extends ChangeNotifier {
//   final List<Map<String, dynamic>> _favorites = [];

//   List<Map<String, dynamic>> get favorites => _favorites;

//   void toggleFavorite(Map<String, dynamic> product) {
//     final exists = _favorites.any((p) => p['name'] == product['name']);

//     if (exists) {
//       _favorites.removeWhere((p) => p['name'] == product['name']);
//     } else {
//       _favorites.add(product);
//     }

//     notifyListeners();
//   }

//   bool isFavorite(String name) {
//     return _favorites.any((p) => p['name'] == name);
//   }
//
 