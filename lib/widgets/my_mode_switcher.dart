import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mi_store/cubit/cubit.dart';
import 'package:mi_store/cubit/states.dart';

class MyModeSwithcer extends StatelessWidget {
  const MyModeSwithcer({super.key});
  ShopCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return FlutterSwitch(
            toggleColor: Theme.of(context).colorScheme.secondary,
            width: 33,
            activeTextColor: Colors.red,
            inactiveTextColor: Theme.of(context).colorScheme.primary,
            activeIcon: const Icon(
              Icons.dark_mode,
              color: Colors.black,
            ),
            inactiveIcon: const Icon(
              Icons.light_mode,
              color: Colors.amber,
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.primary,
            value: cubit(context).isDark,
            onToggle: (value) {
              cubit(context).changeMode(value);
            });
      },
    );
  }
}
