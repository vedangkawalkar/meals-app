import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  
  const Maindrawer({super.key,required this.onselectscreen});

  final void Function(String identifier) onselectscreen;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8), 
                ] ,
                begin:Alignment.topLeft ,
                end: Alignment.bottomRight,
              )
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood,size:48 ,color: Theme.of(context).colorScheme.primary,),
                const SizedBox(width: 18,),
                Text('Cooking App',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary,),),
              ],
            )
          ),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,color: Theme.of(context).colorScheme.onBackground,),
            title: Text('Meals',style:  Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground,fontSize: 24,),),
            onTap: (){
               onselectscreen('meals');
            }
            ,
          ),
            ListTile(
            leading: Icon(Icons.settings,size: 26,color: Theme.of(context).colorScheme.onBackground,),
            title: Text('Filters',style:  Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground,fontSize: 24,),),
            onTap: (){
              onselectscreen('filters');
            }
            ,
          )
        ],
      ),
    );
  }
}