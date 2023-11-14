import 'package:mi_store/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_store/models/product_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(InitialState());

  final List<ProductModel> shop = [
    ProductModel(
        imagePath: 'assets/images/gp8pro.png',
        name: 'Google Pixel 8 pro',
        price: 1100,
        descreption:
            ' premium Android experience with a focus on simplicity, performance, and photography.'),
    ProductModel(
        imagePath: 'assets/images/sv1.png',
        name: 'Sauvage Dior',
        price: 300,
        descreption:
            'Sauvage is more than a fragrance; it\'s a statement, a signature scent that embodies the confident, refined man of today'),
    ProductModel(
        imagePath: 'assets/images/rm1.png',
        name: 'Richard Mille',
        price: 14000,
        descreption:
            'where artistry meets precision, and luxury intertwines with innovation. A symbol of unrivaled craftsmanship, each Richard Mille watch is a testament to the brand\'s commitment to pushing the boundaries of horological excellence.'),
  ];

  // user cart
  List<ProductModel> cart = [];

  // add item to cart
  void addToCart(ProductModel item) {
    cart.add(item);
    emit(AddTocartState());
  }

  // remove item from cart
  void removeFromCart(ProductModel item) {
    cart.remove(item);
    emit(RemoveFromCartState());
  }

  bool isDark = true;
  void changeMode(bool value) {
    isDark = value;
    emit(ChangeModeState());
  }
}
