part of 'models.dart';

class Menus {
  List<Food> foods;
  List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods:
            json['foods'].map<Food>((foods) => Food.fromJson(foods)).toList(),
        drinks: json['drinks']
            .map<Drink>((drinks) => Drink.fromJson(drinks))
            .toList(),
      );
}
