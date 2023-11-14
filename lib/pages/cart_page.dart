// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mi_store/cubit/cubit.dart';
import 'package:mi_store/cubit/states.dart';
import 'package:mi_store/widgets/my_mode_switcher.dart';
import 'package:mi_store/widgets/my_product_container.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CartPage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CartPage({super.key});
  static String id = 'cartPage';
  ShopCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            // ignore: prefer_const_literals_to_create_immutables
            actions: [MyModeSwithcer()],
            centerTitle: true,
            elevation: 0,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            backgroundColor: Colors.transparent,
            title: const Text('Your Cart'),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              cubit(context).cart.isEmpty
                  ? Text(
                      'your cart is empty Back to shop',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 18),
                    )
                  : Text(
                      'your cart is ready ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 18),
                    ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 60),
                child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit(context).cart.length,
                      itemBuilder: (context, index) => MYProductContainer(
                            icon: Icons.remove,
                            productModel: cubit(context).cart[index],
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: 'Item added to your cart',
                                  backgroundColor: Colors.red);
                              cubit(context)
                                  .removeFromCart(cubit(context).shop[index]);
                              Fluttertoast.showToast(
                                  msg: 'Item removed from cart',
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
        );
      },
    );
  }
}
