class ProductModel {
  final String id;
  final DateTime createdAt;
  final String productName;
  final String price;
  final String oldPrice;
  final String sale;
  final String description;
  final String category;
  final String? imageUrl;
  final double? rating; // ⭐
  final List<FavoriteProduct> favoriteProducts;
  final List<PurchaseTable> purchaseTable;

  ProductModel({
    required this.id,
    required this.createdAt,
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.sale,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.favoriteProducts,
    required this.purchaseTable,
    this.rating, // ⭐
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      createdAt: DateTime.parse(json["created_at"]),
      productName: json["product_name"],
      price: json["price"],
      oldPrice: json["old_price"],
      sale: json["sale"],
      description: json["description"],
      category: json["category"],
      imageUrl: json["imge_url"],
      favoriteProducts: (json["Favorite_product"] as List<dynamic>)
          .map((e) => FavoriteProduct.fromJson(e))
          .toList(),
      purchaseTable: (json["purchase_table"] as List<dynamic>)
          .map((e) => PurchaseTable.fromJson(e))
          .toList(),
      rating: json['rating'] != null ? (json['rating']).toDouble() : null, // ⭐
    );
  }
}

class FavoriteProduct {
  final String id;
  final String forUser;
  final DateTime createdAt;
  final String forProduct;
  final bool isFavorite;

  FavoriteProduct({
    required this.id,
    required this.forUser,
    required this.createdAt,
    required this.forProduct,
    required this.isFavorite,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json["id"],
      forUser: json["for_user"],
      createdAt: DateTime.parse(json["created_at"]),
      forProduct: json["for_product"],
      isFavorite: json["is_Favorite"],
    );
  }
}

class PurchaseTable {
  final String id;
  final String forUser;
  final bool isBought;
  final DateTime createdAt;
  final String forProduct;

  PurchaseTable({
    required this.id,
    required this.forUser,
    required this.isBought,
    required this.createdAt,
    required this.forProduct,
  });

  factory PurchaseTable.fromJson(Map<String, dynamic> json) {
    return PurchaseTable(
      id: json["id"],
      forUser: json["for_user"],
      isBought: json["is_bought"],
      createdAt: DateTime.parse(json["created_at"]),
      forProduct: json["for_product"],
    );
  }
}
