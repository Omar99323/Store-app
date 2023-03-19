class SearchResponseModel {
  final bool status;
  final SearchDataModel data;

  SearchResponseModel({required this.status, required this.data});

  factory SearchResponseModel.fromjson(Map<String, dynamic> json) {
    return SearchResponseModel(
      status: json['status'],
      data: SearchDataModel.fromjson(json['data']),
    );
  }
}

class SearchDataModel {
  final List<SearchProductModel> searchProducts = [];

  SearchDataModel.fromjson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      searchProducts.add(SearchProductModel.fromjson(element));
    });
  }
}

class SearchProductModel {
  final int id;
  final dynamic price;
  final dynamic oldprice;
  final dynamic discount;
  final String name;
  final String image;
  bool infavorites = false;
  bool incart = false;

  SearchProductModel({
    required this.id,
    required this.price,
    required this.oldprice,
    required this.discount,
    required this.name,
    required this.image,
    required this.infavorites,
    required this.incart,
  });

  factory SearchProductModel.fromjson(Map<String, dynamic> json) {
    return SearchProductModel(
      id: json['id'],
      price: json['price'],
      oldprice: json['old_price'],
      discount: json['discount'],
      name: json['name'],
      image: json['image'],
      infavorites: json['in_favorites'],
      incart: json['in_cart'],
    );
  }
}

