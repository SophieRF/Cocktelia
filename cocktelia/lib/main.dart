import 'package:cocktelia/recipe/state_managment/recipe_provider.dart';
import 'package:cocktelia/home/home_screen.dart';
import 'package:cocktelia/splash/splash_screen.dart';
import 'package:cocktelia/widgets/category_card/state_managment/category_card_provider.dart';
import 'package:cocktelia/widgets/recipe_card/state_managment/recipe_cards_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  recipeCardProvider.loadAllRecipes().then((_) {
    runApp(const MainApp());
  });
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RecipeProvider()),
        ChangeNotifierProvider(
          create: (_)=> RecipeCardProvider()),
        ChangeNotifierProvider(
          create: (_)=> CategoryCardProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: false,
        builder: (context, child){
          return MaterialApp(
            title: 'CocktElia',
            debugShowCheckedModeBanner: false,
            initialRoute: "splash",
            routes: {
              "splash":(context)=>const SplashScreen(),
            },
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const MyHomePage(),
        );}
      ),
    );
  }
}


