class RecipeCardModel{
  RecipeCardModel({required this.id, required this.recipeImage, required this.recipeName, required this.category});

  final int id;
  final String recipeImage;
  final String recipeName;
  final String category;

  factory RecipeCardModel.fromJson(Map<String, dynamic> json) {
    return RecipeCardModel(
      id: json['id'] as int,
      recipeImage: json['image'] as String,
      recipeName: json['name'] as String,
      category: json['category'] as String,
    );
  }
}