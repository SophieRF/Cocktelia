import 'package:cocktelia/favorites/favorites_screen.dart';
import 'package:cocktelia/ui.theme/color_scheme_app.dart';
import 'package:cocktelia/widgets/category_card/model/category_card_model.dart';
import 'package:cocktelia/widgets/recipe_card/model/recipecard_model.dart';
import 'package:cocktelia/widgets/recipe_card/recipes_grid.dart';
import 'package:cocktelia/widgets/recipe_card/state_managment/recipe_cards_provider.dart';
import 'package:cocktelia/widgets/tab_bar/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AllRecipesScreen extends StatelessWidget{

  const AllRecipesScreen({super.key, required this.selectedCategory});
  final CategoryCardModel selectedCategory;

  @override
  Widget build(BuildContext context) {
  recipeCardProvider.loadAllRecipes();
  List<RecipeCardModel> filteredRecipes = recipeCardProvider.getRecipesByCategory(selectedCategory.categoryName);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity.sp, 110.sp),
          child: const TabAppBar(tabCategory: 'Recetas'),
          ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    darkBrown,
                    lightBrown,
                  ],
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 1.0],
                ),
              ),
              alignment: Alignment.center,
              //Grilla de recetas
              child: RecipesGrid(recipes: filteredRecipes),
            ),
            //Tab de la otra pestaña
            const FavoritesMenu(),
          ],
        ),
      ),
    );
  }
}