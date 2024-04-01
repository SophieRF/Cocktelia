import 'package:cocktelia/recipe/model/recipe_model.dart';
import 'package:cocktelia/recipe/state_managment/recipe_provider.dart';
import 'package:cocktelia/recipe/widgets/favorite_button.dart';
import 'package:cocktelia/recipe/widgets/h1_title_drinkname.dart';
import 'package:cocktelia/recipe/widgets/illustrative_img.dart';
import 'package:cocktelia/ui.theme/color_scheme_app.dart';
import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatelessWidget {
    const RecipeScreen({
    super.key,
    required this.drinkImage,
    required this.drinkName,
    required this.drinkIngredients,
    required this.howToMake,
  });
  
  final String drinkImage;
  final String drinkName;
  final String drinkIngredients;
  final String howToMake;

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, recipeProvider, _) {  
        var isFavorite = recipeProvider.isFavorite(drinkName: drinkName);
      return Scaffold(
        body: Container(
          height: double.infinity.sp,
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
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IllustrativeIMG(drinkImage: drinkImage),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0.sp, left: 20.0.sp, right: 20.0.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            drinkIngredients,
                            style: textStyleBase.paragraph24,
                          ),
                          SizedBox(height: 14.sp),
                          Text(
                            howToMake,
                            style: textStyleBase.paragraph24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 224.sp,
                  left: 8.sp,
                  child: TitleDrinkName(drinkName: drinkName)
                ),
                Positioned(
                  right: 0.sp,
                  top: 236.sp,
                  child: FavoriteButton(
                    isFavorite: isFavorite, 
                    onFavoriteTap:(String drinkName){
                        if (isFavorite) {
                              recipeProvider.removeFavorite(RecipeModel(drinkImage: drinkImage, drinkName: drinkName, drinkIngredients: drinkIngredients, howToMake: howToMake));
                            } else {
                              recipeProvider.addIntoFavorites(RecipeModel(drinkImage: drinkImage, drinkName: drinkName, drinkIngredients: drinkIngredients, howToMake: howToMake));
                            }
                    }, drinkName: drinkName,
                    ),
                ),
                const BackButton(),
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}