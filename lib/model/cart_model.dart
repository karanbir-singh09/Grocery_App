import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
//
//ITems for sale----------------------------------------------------------------
//
  final List _shopItems = [
    //[itemName, itemPrice, imagePath, color]
    //--------------------------------------------------------------------------
    ["Avocado", "40.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "50.00", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "280.00", "lib/images/chicken.png", Colors.brown],
    ["Water", "20.00", "lib/images/water.png", Colors.blue],
  ];
//
//Items In Cart-----------------------------------------------------------------
//  
  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;
//
//adding Item In the cart-------------------------------------------------------
//
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
//
//removing Items From The Cart--------------------------------------------------
//
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
//
//Total Price Calculation-------------------------------------------------------
//
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
  return totalPrice.toStringAsFixed(2);
  }
}
