class HomeModel {
  final bool status;
  final HomeDataModel data;

  HomeModel({required this.status, required this.data});

  factory HomeModel.fromjson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      data: HomeDataModel.fromjson(json['data']),
    );
  }
}

class HomeDataModel {
  final List<BannerModel> banners=[];
  final List<ProductModel> products=[];


  HomeDataModel.fromjson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromjson(element));
    });
    json['products'].forEach((element) {
      products.add(ProductModel.fromjson(element));
    });
  }
}

class BannerModel {
  final int id;
  final String image;

  BannerModel({required this.id, required this.image});

  factory BannerModel.fromjson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
    );
  }
}

class ProductModel {
  final int id;
  final dynamic price;
  final dynamic oldprice;
  final dynamic discount;
  final String name;
  final String image;
  final bool infavorites;
  final bool incart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldprice,
    this.discount,
    required this.name,
    required this.image,
    required this.infavorites,
    required this.incart,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
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
