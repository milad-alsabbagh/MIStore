import 'package:flutter/material.dart';
import 'package:mi_store/pages/cart_page.dart';
import 'package:mi_store/pages/home_page.dart';
import 'package:mi_store/widgets/my_listTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 70,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            MyListTile(
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Shop'),
            MyListTile(
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CartPage.id);
                },
                text: 'Cart'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: MyListTile(
              icon: Icons.logout_outlined,
              onTap: () {
                Navigator.pushNamed(context, HomePage.id);
              },
              text: 'Exit'),
        ),
      ]),
    );
  }
}
