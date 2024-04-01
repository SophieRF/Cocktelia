class CategoryCardModel {
  CategoryCardModel({required this.id, required this.categoryImage, required this.categoryName});

  final int id;
  final String categoryImage;
  final String categoryName;

  factory CategoryCardModel.fromJson(Map<String, dynamic> json) {
    return CategoryCardModel(
      id: json['id'] as int,
      categoryImage: json['categoryImage'] as String,
      categoryName: json['categoryName'] as String,
    );
  }
}
