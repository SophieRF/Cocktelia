import 'package:cocktelia/all_recipes/all_recipes_screen.dart';
import 'package:cocktelia/widgets/category_card/model/category_card_model.dart';
import 'package:cocktelia/widgets/category_card/widget/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatefulWidget{
  const CategoryCard({
  super.key,
  required this.categoryCards,
  this.selectedCategory});
  
  final CategoryCardModel categoryCards;
  final String? selectedCategory;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{
        setState(() {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=> AllRecipesScreen(
                selectedCategory: widget.categoryCards)));
        })
      },
      child: Container(
        width: double.infinity,
        height: 200.sp,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(188, 0, 0, 0),
              spreadRadius: 2.sp,
              blurRadius: 7.sp,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: CategoryCardStack(categoryCards: widget.categoryCards)
      ),
    );
  }
}