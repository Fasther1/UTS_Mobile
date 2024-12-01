import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FoodMenuPage(),
    );
  }
}

class FoodMenuPage extends StatefulWidget {
  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  // Daftar makanan yang tersedia
  final List<Map<String, dynamic>> foodMenu = [
    {'name': 'Pizza', 'price': 12000},
    {'name': 'Burger', 'price': 15000},
    {'name': 'Pasta', 'price': 18000},
    {'name': 'Sushi', 'price': 20000},
    {'name': 'Salad', 'price': 10000},
  ];

  // Keranjang makanan yang dipilih
  final List<Map<String, dynamic>> cart = [];

  // Menambah item ke keranjang
  void addToCart(Map<String, dynamic> food) {
    setState(() {
      cart.add(food);
    });
  }

  // Menghitung total harga keranjang
  int calculateTotal() {
    return cart.fold(0, (total, item) => total + item['price']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Ordering App'),
      ),
      body: Column(
        children: [
          // Menu Makanan
          Expanded(
            child: ListView.builder(
              itemCount: foodMenu.length,
              itemBuilder: (context, index) {
                var food = foodMenu[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(food['name']),
                    subtitle: Text('Price: Rp${food['price']}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        addToCart(food);
                      },
                      child: Text('Add to Cart'),
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Keranjang Makanan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total: Rp${calculateTotal()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (cart.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Keranjang kosong!')));
                    } else {
                      // Proses pemesanan
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Order Confirmed'),
                            content: Text('Your order has been placed!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    cart.clear(); // Clear the cart after order
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Place Order'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
