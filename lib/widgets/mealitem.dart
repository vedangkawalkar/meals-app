import 'package:flutter/material.dart';
// import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/mealitemtrait.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget{
  const Mealitem({super.key,required this.meal,required this.onselectmeal});

  final Meal meal;
  final Function(BuildContext context, Meal meal) onselectmeal;

String get complexitytext {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilitytext {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          onselectmeal(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image:NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
             ),
             
             Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                child: Column(
                 children:[ Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow:TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Mealitemtrait(
                      icon:Icons.schedule,
                    label: '${meal.duration} min' ),
                    const SizedBox(width: 10,),
                    Mealitemtrait(
                      icon:Icons.work,
                    label: complexitytext  ),
                    const SizedBox(width: 10,),
                     Mealitemtrait(
                      icon:Icons.attach_money_rounded,
                    label: affordabilitytext  ),
                  ],)
          ]),
              ),
              )
          ],
        ),
      ),
    );    
  }
}