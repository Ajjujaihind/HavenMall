// ignore: file_names
import 'package:flutter/material.dart';
import 'package:havenmall/constants/navigator.dart';
import 'package:havenmall/screens/product_details/product_details.dart';
import '../../firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import '../../models/catergories_Model/categories_Model.dart';
import '../../models/products_Model/products_Model.dart';
import '../../widgets/topTittle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> cateforiesList = [];
  List<ProductModel> topSellingProdusctsList = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoriesListdataAndtopSellingProdusctsList();
  }

  void getCategoriesListdataAndtopSellingProdusctsList() async {
    isLoading = true;
    setState(() {});
    cateforiesList = await FirestoreHelper.getcategories();
    topSellingProdusctsList = await FirestoreHelper.getTopSellingProducts();
    topSellingProdusctsList.shuffle();
    cateforiesList.shuffle();

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopTittle(title: "", subtitle: "HavenMall"),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: "Search...."),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  cateforiesList.isEmpty
                      ? Center(child: Text(" cateforiesList is Empty"))
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: cateforiesList
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Card(
                                        elevation: 13,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Container(
                                          height: 130,
                                          width: 130,
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(
                                                    e.image.toString(),
                                                    fit: BoxFit.cover,
                                                  )),
                                              Text(
                                                e.name.toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                  const Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Top selling",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  topSellingProdusctsList.isEmpty
                      ? Center(child: Text("Product is empty"))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            primary: false,
                            padding: EdgeInsets.zero,
                            itemCount: topSellingProdusctsList.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              ProductModel singleProduct =
                                  topSellingProdusctsList[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xffE0E0E0), // Border color
                                    width: 1.2, // Border width
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Center(
                                          child: Image.network(
                                            singleProduct.image!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        "${singleProduct.name!}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Text(
                                      "Price: ${singleProduct.price!}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    OutlinedButton(
                                        onPressed: () {
                                          NavigationHelper.push(
                                              widget: ProductDetails(
                                                  singleProduct: singleProduct),
                                              context: context);
                                        },
                                        child: Text("Buy"))
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                ],
              ),
            ),
    );
  }
}
