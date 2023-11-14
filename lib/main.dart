import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_store/cubit/cubit.dart';
import 'package:mi_store/cubit/states.dart';
import 'package:mi_store/pages/cart_page.dart';
import 'package:mi_store/pages/home_page.dart';
import 'package:mi_store/pages/shop_page.dart';
import 'package:mi_store/themes/theme.dart';

void main() {
  runApp(const MinimalStore());
}

class MinimalStore extends StatelessWidget {
  const MinimalStore({super.key});
  ShopCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: Builder(
        builder: (context) => BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp(
              darkTheme: darKTheme,
              theme: lightTheme,
              themeMode:
                  cubit(context).isDark ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              routes: {
                HomePage.id: (context) => HomePage(),
                ShopPage.id: (context) => ShopPage(),
                CartPage.id: (context) => CartPage(),
              },
              initialRoute: HomePage.id,
            );
          },
        ),
      ),
    );
  }
}
