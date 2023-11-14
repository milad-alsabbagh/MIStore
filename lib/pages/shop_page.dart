import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mi_store/cubit/cubit.dart';
import 'package:mi_store/cubit/states.dart';
import 'package:mi_store/pages/cart_page.dart';
import 'package:mi_store/widgets/my_drawer.dart';
import 'package:mi_store/widgets/my_mode_switcher.dart';
import 'package:mi_store/widgets/my_product_container.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopPage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ShopPage({super.key});
  ShopCubit cubit(context) => BlocProvider.of(context);
  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            backgroundColor: Colors.transparent,
            title: const Text('Shop Page'),
            actions: const [MyModeSwithcer()],
          ),
          drawer: const MyDrawer(),
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'shop from our selected item',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit(context).shop.length,
                      itemBuilder: (context, index) => MYProductContainer(
                            productModel: cubit(context).shop[index],
                            icon: Icons.add,
                            onTap: () {
                              cubit(context)
                                  .addToCart(cubit(context).shop[index]);
                              Fluttertoast.showToast(
                                  msg: 'Item added to your cart',
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  textColor: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary);
                            },
                          )),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.id);
            },
            child: const Icon(Icons.shopping_cart),
          ),
        );
      },
    );
  }
}
