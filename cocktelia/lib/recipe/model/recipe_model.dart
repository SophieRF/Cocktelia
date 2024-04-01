class RecipeModel{
  RecipeModel({required this.drinkImage, required this.drinkName, required this.drinkIngredients, required this.howToMake});

  final String drinkName;
  final String drinkImage;
  final String drinkIngredients;
  final String howToMake;

factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      drinkName: json['drinkName'] as String,
      drinkImage: json['drinkImage'] as String,
      drinkIngredients: json['drinkIngredients'] as String,
      howToMake: json["howToMake"] as String,
    );
  }
}