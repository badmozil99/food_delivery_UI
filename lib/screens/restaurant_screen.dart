import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/contact_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';


class RestaurantScreen extends StatefulWidget {

  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  _buildMenuItem(Food menuItem){
    return Center(child:
    Stack(alignment: Alignment.center,
      children: [
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(menuItem.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.3),
            ],
            begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops:[
                0.1,
                0.4,
                0.6,
                0.9,
              ]
            )
          ),
        ),
        Positioned(
          bottom: 65.0,
          child: Column(children: [
            Text(menuItem.name,
            style: TextStyle(color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
            ),
            Text('\$${menuItem.price}',
                style: TextStyle(color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),)
          ],),
        ),
        Positioned(
          right: 10.0,
          bottom: 10.0,
          child: Container(
            width: 48.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Theme.of(context).primaryColor
            ),
            child: IconButton(
              icon: Icon(Icons.add,
              color: Colors.white,),
              iconSize: 30.0,
              onPressed: (){},
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: Image(image: AssetImage(widget.restaurant.imageUrl),
                  width: MediaQuery.of(context).size.width,
                  fit:BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 30.0,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite),
                    color: Theme.of(context).primaryColor, iconSize: 30.0,)
                  ]
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.restaurant.name,
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
                    Text('0.2 miles away',
                    style: TextStyle(fontSize: 18.0),)
                  ],
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(height: 6.0),
                Text(widget.restaurant.address,
                style: TextStyle(fontSize: 18.0),)
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){}, child: Text('Review',
                  style: TextStyle(
                      fontSize: 20.0
                  )), style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30.0)
              ),
              ),
             TextButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return ContactScreen();
               }));
             }, child: Text('Contact',
             style: TextStyle(
               fontSize: 20.0
             )), style: TextButton.styleFrom(
               primary: Colors.white,
               backgroundColor: Theme.of(context).primaryColor,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10.0)
               ),
               padding: EdgeInsets.symmetric(horizontal: 30.0)
             ),
              ),

          ],),
          SizedBox(height: 10.0),
          Center(
            child: Text('Menu',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),),
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
            children: List.generate(widget.restaurant.menu.length, (index)
            {Food food = widget.restaurant.menu[index];
            return _buildMenuItem(food);
            }
            ),
            ),
          )
          //crossAxisCount: we have 2 different columns on the menu portion
        ],

      )
    );
  }
}
