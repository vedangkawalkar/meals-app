import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favoritesprovider.dart';


class Mealdetailsscreen extends ConsumerWidget {
  const Mealdetailsscreen({
    super.key,
    required this.meal,
    // required this.ontogglefavorite
  });

  final Meal meal;
  //final void Function(Meal meal) ontogglefavorite;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final favoritemeals = ref.watch(favoritesprovider);
    final isfavorite = favoritemeals.contains(meal);

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  final wasadded = ref.read(favoritesprovider.notifier).togglefavorites(meal);
                  ScaffoldMessenger.of(context).clearSnackBars(); ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(wasadded ? 'Meal added as favorite':'Meal removed from favorites'),
                  ),
                );
                  //    ontogglefavorite(meal);
                },
                icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween(
                      begin:0.5,
                      end: 1.0
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child:Icon(
                  isfavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isfavorite),
                  ) ,
                ),
              //   Icon(
              //     isfavorite? Icons.star : Icons.star_border
              // )
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Ingridients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              for (final steps in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Text(
                    steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
