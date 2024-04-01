import 'package:cocktelia/recipe/state_managment/recipe_provider.dart';
import 'package:cocktelia/widgets/category_card/state_managment/category_card_provider.dart';
import 'package:cocktelia/widgets/recipe_card/state_managment/recipe_cards_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension BuildContextExtension on BuildContext{
  CategoryCardProvider get categoryCardProvider => Provider.of<CategoryCardProvider>(this);
  RecipeCardProvider get recipeCardProvider => Provider.of<RecipeCardProvider>(this);
  RecipeProvider get recipeProvider => Provider.of<RecipeProvider>(this);
}