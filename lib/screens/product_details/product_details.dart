import 'package:flutter/material.dart';
import 'package:havenmall/models/products_Model/products_Model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int productQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_sharp))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
                width: 400,
                height: 300,
                child: AspectRatio(
                  aspectRatio: 15,
                  child: Image.network(
                    widget.singleProduct.image.toString(),
                    alignment: Alignment.center,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.singleProduct.name.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      if (widget.singleProduct.isFavourite == true) {
                        widget.singleProduct.isFavourite = false;
                      } else {
                        widget.singleProduct.isFavourite = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(widget.singleProduct.isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.singleProduct.description.toString()),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red.shade400,
                  child: IconButton(
                    onPressed: () {
                      if (productQuantity > 1) {
                        productQuantity--;
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  productQuantity.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.red.shade400,
                  child: IconButton(
                    onPressed: () {
                      productQuantity++;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text("Add to Cart"),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 38,
                  width: 150,
                  child: ElevatedButton(onPressed: () {}, child: Text("Buy")),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
