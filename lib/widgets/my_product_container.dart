import 'package:flutter/material.dart';
import 'package:mi_store/models/product_model.dart';

class MYProductContainer extends StatelessWidget {
  const MYProductContainer(
      {super.key,
      required this.productModel,
      required this.onTap,
      required this.icon});
  final ProductModel productModel;
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 330,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // product image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      width: 300,
                      height: 350,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Image(
                        image: AssetImage(productModel.imagePath),
                        fit: BoxFit.cover,
                      )),
                ),

                // product name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    productModel.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                // product descreption
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    productModel.descreption,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            // product price + add to cart button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${productModel.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.secondary),
                    child: IconButton(onPressed: onTap, icon: Icon(icon)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
