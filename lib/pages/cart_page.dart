import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//
//CART Title--------------------------------------------------------------------
//
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'My Cart',
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, fontSize: 20),
          )),
//
//Items In The Cart-------------------------------------------------------------
//
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                padding: const EdgeInsets.all(12.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 36,
                        ),
                        title: Text(
                          value.cartItems[index][0],
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('\₹' + value.cartItems[index][1]),
                        trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index)),
                      ),
                    ),
                  );
                },
              ),
            ),
//
//Total Bill--------------------------------------------------------------------
//
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Bill",
                          style: GoogleFonts.notoSerif(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\₹  ' + value.calculateTotal(),
                          style: GoogleFonts.notoSerif(color: Colors.grey[300]),
                        ),
                      ],
                    ),
//
//PAY NOW BUTTON-$$$$$$$$$$$$$$$$$$$--------------------------------------------
//
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            "PAY NOW",
                            style: GoogleFonts.notoSerif(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey[300])
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
