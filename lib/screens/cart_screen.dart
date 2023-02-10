import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  _buildCartItem(Order order){
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.food.name,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                            overflow: TextOverflow.ellipsis),

                        SizedBox(height: 10.0),

                        Text(order.restaurant.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0
                            ),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(width: 0.8,
                            color: Colors.black54)
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){},
                                child: Text('-',
                                style: TextStyle(color: Theme.of(context).primaryColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),),
                              ),

                              SizedBox(width: 20.0),

                              Text(order.quantity.toString()),

                              SizedBox(width: 20.0),

                              GestureDetector(
                                onTap:(){},
                                child: Text('+',
                                style: TextStyle(color: Theme.of(context).primaryColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text('\$${order.quantity * order.food.price}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0
            ),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((Order order)=> totalPrice += order.quantity * order.food.price);
    //This code will loop through the cart and add the total price of each item all together
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
      backgroundColor: Theme.of(context).primaryColor,),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if(index < currentUser.cart.length)
            {Order order = currentUser.cart[index];
            return _buildCartItem(order);}
            //in order to show the estimated time and total cost, this code will
            //check if index number is less than the cart items
            //from the Doc for itemBuilder the value of index will always be between
            //0 and one less than itemCount
            //itemCount is 6 then index will be 5
            //since 5 cannot be less than 5 the second condition of the code runs
            //return Column....
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Estimated Delivery Time:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),),
                      Text('25min',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),)
                    ],
                  ),
                  SizedBox(height: 10.0),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Cost:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text('\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0
                      ),),
                    ],
                  ),
                  SizedBox(height: 80.0),
                ],
              ),
            );

          },
          itemCount: currentUser.cart.length + 1,
        separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1.0,
              color: Colors.grey,
            );
        } ,
      ),
      bottomSheet: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        //spans the entire screen
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0
            )
          ]
        ),
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'CHECKOUT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0
              ),
            ),
          ),
        ),
      ),
    );
  }
}
