import 'package:flutter/material.dart';
class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int itemCount1 = 0;
  int itemCount2 = 0;
  int itemCount3 = 0;

  int getPrice(String itemName) {
    // Define item prices based on item name (you can use a map or database in real app)
    switch (itemName) {
      case 'T-shirt':
        return 20;
      case 'Sweatshirt':
        return 35;
      case 'Jeans':
        return 50;
      default:
        return 0;
    }
  }

  int calculateTotalAmount() {
    // Calculate total amount based on item counts and prices
    int totalAmount = (itemCount1 * getPrice('T-shirt')) +
        (itemCount2 * getPrice('Sweatshirt')) +
        (itemCount3 * getPrice('Jeans'));
    return totalAmount;
  }

  void incrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1 && itemCount1 < 5) {
        itemCount1++;
      } else if (itemIndex == 2 && itemCount2 < 5) {
        itemCount2++;
      } else if (itemIndex == 3 && itemCount3 < 5) {
        itemCount3++;
      }
    });
  }

  void decrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1 && itemCount1 > 0) {
        itemCount1--;
      } else if (itemIndex == 2 && itemCount2 > 0) {
        itemCount2--;
      } else if (itemIndex == 3 && itemCount3 > 0) {
        itemCount3--;
      }
    });
  }

  void checkout() {
    int totalItems = itemCount1 + itemCount2 + itemCount3;
    int totalAmount = calculateTotalAmount();
    showSnackbar(context,
        'Congratulations! You have added $totalItems items to your bag. Total amount: \$$totalAmount');
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Bag', style: TextStyle(fontSize: 50),),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                buildItemCard('T-shirt', 'M', 'Blue', itemCount1, 1),
                buildItemCard('Sweatshirt', 'L', 'Red', itemCount2, 2),
                buildItemCard('Jeans', 's', 'Black', itemCount3, 3),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Amount: \$${calculateTotalAmount()}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
              ),
              onPressed: checkout,
              child: const Text('CHECK OUT',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ]));
  }

  Widget buildItemCard(String itemName, String size, String color,
      int itemCount, int itemIndex) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage('assets/$itemName.jpg')),
        title: Text(itemName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Color : $color'),
            Text('Size :  $size'),
            Text('Price : \$${getPrice(itemName)}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => decrementItem(itemIndex),
            ),
            Text('$itemCount'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => incrementItem(itemIndex),
            ),
          ],
        ),
      ),
    );
  }
}