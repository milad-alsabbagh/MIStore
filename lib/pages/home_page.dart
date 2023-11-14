import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_store/pages/shop_page.dart';
import 'package:mi_store/widgets/my_button.dart';
import 'package:mi_store/widgets/my_mode_switcher.dart';

class HomePage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});
  static String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [const MyModeSwithcer()],
        centerTitle: true,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Icon(
            Icons.shopping_bag,
            size: 140,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Mi Store',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Shopping is A journey start it',
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            onTap: () {
              Navigator.pushNamed(context, ShopPage.id);
            },
            child: const Icon(Icons.arrow_forward),
          ),
          const Spacer(
            flex: 3,
          ),
          Text(
            'Milad Alsabbagh',
            style: GoogleFonts.charm(fontSize: 26),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }
}
