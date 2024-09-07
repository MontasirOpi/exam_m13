import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int pulloverQty = 1;
  int tshirtQty = 1;
  int sportDressQty = 1;

  final int pulloverPrice = 51;
  final int tshirtPrice = 30;
  final int sportDressPrice = 43;

  int get totalAmount {
    return (pulloverQty * pulloverPrice) +
        (tshirtQty * tshirtPrice) +
        (sportDressQty * sportDressPrice);
  }

  void _showSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Congratulations! You have successfully checked out.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCartItem(
              'Pullover',
              'Black',
              'L',
              pulloverPrice,
              pulloverQty,
              () {
                setState(() {
                  if (pulloverQty > 1) pulloverQty--;
                });
              },
              () {
                setState(() {
                  pulloverQty++;
                });
              },
            ),
            _buildCartItem(
              'T-Shirt',
              'Gray',
              'L',
              tshirtPrice,
              tshirtQty,
              () {
                setState(() {
                  if (tshirtQty > 1) tshirtQty--;
                });
              },
              () {
                setState(() {
                  tshirtQty++;
                });
              },
            ),
            _buildCartItem(
              'Sport Dress',
              'Black',
              'M',
              sportDressPrice,
              sportDressQty,
              () {
                setState(() {
                  if (sportDressQty > 1) sportDressQty--;
                });
              },
              () {
                setState(() {
                  sportDressQty++;
                });
              },
            ),
            const Spacer(),
            Text(
              'Total amount: \$$totalAmount',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showSnackbar(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              child: const Text('CHECK OUT'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String title, String color, String size, int price,
      int qty, VoidCallback onDecrement, VoidCallback onIncrement) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              'https://th.bing.com/th/id/OIP.yIH6aCgQDBw1ka80SuALZwHaLH?w=202&h=303&c=7&r=0&o=5&dpr=1.3&pid=1.7',
              height: 60,
              width: 60,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('Color: $color  Size: $size'),
                  Text('\$$price'),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onDecrement,
                ),
                Text('$qty', style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onIncrement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}