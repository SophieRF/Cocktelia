import 'package:cocktelia/recipe/recipe_screen.dart';
import 'package:cocktelia/widgets/recipe_card/model/recipecard_model.dart';
import 'package:cocktelia/widgets/recipe_card/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../recipe/state_managment/recipe_provider.dart';

class RecipesGrid extends StatelessWidget{
  const RecipesGrid({super.key, required this.recipes});

  final List<RecipeCardModel> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top:16.0.sp, left: 16.0.sp),
      shrinkWrap: true,
      itemCount: recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10), 
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            recipeProvider.selectRecipeByName(recipes[index].recipeName);
            final selectedRecipe = recipeProvider.selectedRecipe;
            if (selectedRecipe != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeScreen(
                    drinkImage: recipes[index].recipeImage,
                    drinkName: recipes[index].recipeName,
                    drinkIngredients: selectedRecipe.drinkIngredients,
                    howToMake: selectedRecipe.howToMake,
                  ),
                ),
              );
            }
          },
          child: RecipeCard(
            recipeName: recipes[index].recipeName, 
            recipeImage: recipes[index].recipeImage),
        );
      }), 
    );
  } 
}