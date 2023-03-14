class CategoriesResponseModel {
  final bool status;
  final CategoriesDataModel data;

  CategoriesResponseModel({required this.status, required this.data});

  factory CategoriesResponseModel.fromjson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      status: json['status'],
      data: CategoriesDataModel.fromjson(json['data']),
    );
  }
}

class CategoriesDataModel {
  final List<CategoryModel> categories = [];

  CategoriesDataModel.fromjson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      categories.add(CategoryModel.fromjson(element));
    });
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({required this.name, required this.id, required this.image});

  factory CategoryModel.fromjson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
