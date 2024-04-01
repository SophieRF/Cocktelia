import 'dart:convert';
import 'package:cocktelia/widgets/category_card/model/category_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
class CategoryCardProvider extends ChangeNotifier{
  List<CategoryCardModel> _data = [];
  List<CategoryCardModel> get data => _data;
  //Obtener datos Json para mapearlos y crear una lista de CategoryCards:
  Future<void> loadCategoryCards() async {
      String jsonString = await rootBundle.loadString('lib/widgets/category_card/data/json_category_card.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> dataList = jsonData['categories'];
      _data = dataList.map((json) => CategoryCardModel.fromJson(json)).toList();
    notifyListeners();
    }
}

final categoryCardProvider = CategoryCardProvider();