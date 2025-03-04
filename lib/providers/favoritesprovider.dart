import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>>{
  FavoritesNotifier():super([]);
  
  
  togglefavorites(Meal meal){
    final mealisfavorite = state.contains(meal);

    if (mealisfavorite) {
      state = state.where((element) => element.id!= meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesprovider = StateNotifierProvider<FavoritesNotifier,List<Meal>>((ref) => FavoritesNotifier());