class FavoritesResponseModel {
  final bool status;
  final FavoritesDataModel data;

  FavoritesResponseModel({required this.status, required this.data});

  factory FavoritesResponseModel.fromjson(Map<String, dynamic> json) {
    return FavoritesResponseModel(
      status: json['status'],
      data: FavoritesDataModel.fromjson(json['data']),
    );
  }
}

class FavoritesDataModel {
  final List<FavoriteModel> favorites = [];

  FavoritesDataModel.fromjson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      favorites.add(FavoriteModel.fromjson(element));
    });
  }
}

class FavoriteModel {
  final int id;
  final dynamic price;
  final dynamic oldprice;
  final dynamic discount;
  final String name;
  final String image;

  FavoriteModel(
      {required this.price,
      required this.oldprice,
      required this.discount,
      required this.name,
      required this.id,
      required this.image});

  factory FavoriteModel.fromjson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['product']['id'],
      name: json['product']['name'],
      image: json['product']['image'],
      discount: json['product']['discount'],
      oldprice: json['product']['old_price'],
      price: json['product']['price'],
    );
  }
}
