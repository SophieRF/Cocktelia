import 'dart:convert';
import 'dart:math';
import 'package:cocktelia/recipe/model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecipeProvider extends ChangeNotifier{
  
  RecipeModel? _selectedRecipe;
  final List<RecipeModel> _favoriteRecipes = [];
  List<RecipeModel> _recipes = [];

  List<RecipeModel> get favoriteRecipes => _favoriteRecipes;
  List<RecipeModel> get recipes => _recipes;
  RecipeModel? get selectedRecipe => _selectedRecipe;

  // Actualiza _selectedRecipe con el valor en donde coincidan los nombres de los datos:
  void selectRecipeByName(String recipeName) {
    _selectedRecipe = _recipes.firstWhere(
      (recipe) => recipe.drinkName == recipeName);
      notifyListeners();
    }
  //Se cargan los datos del Json, se parsea a Map y luego se almacena como lista de objetos en _recipes:
  Future<void> loadRecipesFromJson() async {
    final String data = await rootBundle.loadString("lib/recipe/data/json_recipe.json");
    final Map<String, dynamic> jsonResult = json.decode(data);
    final List<dynamic> jsonRecipes = jsonResult["recipe"];
    _recipes = jsonRecipes.map((json) => RecipeModel.fromJson(json)).toList();
    notifyListeners();
  }
  //Función para actualizar la pantalla según se haga scroll
  Future<List<RecipeModel>> fetchMoreRecipes(int currentPage) async {
    const pageSize = 4;
    final startIndex = currentPage * pageSize;
    final endIndex = min(startIndex + pageSize, _recipes.length);
    final newRecipes = _recipes.sublist(startIndex, endIndex);

    notifyListeners(); 
    await Future.delayed(const Duration(seconds: 1));
    return newRecipes;
  }
  //Agregar receta a favoritos:
  void addIntoFavorites(RecipeModel favRecipe) {
  if (!_favoriteRecipes.any((recipe) => recipe.drinkName == favRecipe.drinkName)) {
    _favoriteRecipes.add(favRecipe);
    notifyListeners();
  }
}
  //Eliminar receta de favoritos:
  void removeFavorite(RecipeModel dropRecipe) {
    _favoriteRecipes.removeWhere((recipe) => recipe.drinkName == dropRecipe.drinkName);
    notifyListeners();
  }

  bool isFavorite({required String drinkName}) {
  return _favoriteRecipes.any((recipe) => recipe.drinkName == drinkName);
  }
} 
final recipeProvider = RecipeProvider();