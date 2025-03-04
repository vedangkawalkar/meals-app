import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/mealsprovider.dart';

enum Filter { glutenfree, lactosefree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setfilters(Map<Filter, bool> chosenfilters) {
    state = chosenfilters;
  }

  void setfilter(Filter filter, bool isactive) {
    state = {
      ...state,
      filter: isactive,
    };
  }
}

final filtersprovider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredmealsprovider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activefilters = ref.watch(filtersprovider);
  return meals.where((meal) {
    if (activefilters[Filter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activefilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    return true;
  }).toList();
});
