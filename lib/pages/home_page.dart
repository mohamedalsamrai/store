

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/components/filter_card.dart';
import 'package:store/components/product_card.dart';
import 'package:store/components/search_text_feild.dart';
import 'package:store/components/price_filter.dart';
import 'package:store/models/product.dart';
import 'package:store/services/products_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slect = 0;
  
  Future<List<Product>>? productslist;

  List<String> types = ["Laptops", "PC Components", "Mouses", "Keyboards"];

  @override
  void initState() {
    productslist = ProductsService().getProducts(types[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Store",
            style: TextStyle(
                color: Color(0xff007AFF),
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: "Poppins"),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  width: 37,
                  height: 37,
                  color: const Color(0xff757575),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 38, left: 15, right: 15),
          child: Column(
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: types.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 9),
                      child: TextButton(
                          style: ButtonStyle(
                              overlayColor:
                                  WidgetStatePropertyAll(Colors.grey[300])),
                          onPressed: () {
                            slect = index;
                            productslist =
                                ProductsService().getProducts(types[index]);
                            setState(() {});
                          },
                          child: Text(
                            types[index],
                            style: TextStyle(
                                color: index == slect
                                    ? const Color(0xff007AFF)
                                    : const Color(0xff000000),
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                                fontFamily: "Poppins Medium"),
                          )),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        clipBehavior: Clip.antiAlias,
                        backgroundColor: const Color(0xFFF4F3F8),
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20,
                                  left: 10,
                                  right: 10,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Spacer(),
                                      const Text(
                                        "Filter",
                                        style: TextStyle(
                                            fontFamily: 'Poppins Medium',
                                            fontSize: 21,
                                            color: Color(0xff000000)),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SvgPicture.asset(
                                            "assets/icons/cross.svg"),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const FilterCard(
                                    title: 'Category',
                                    buttomName: 'View All  >',
                                  ),
                                  const FilterCard(
                                      title: "Order", buttomName: 'Select  >'),
                                  const PriceFilter(),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xff007AFF)),
                                      onPressed: () {},
                                      child: const SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            "Apply",
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 18,
                                                fontFamily: 'Poppins Medium'),
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/filter.svg",
                      width: 25,
                      height: 25,
                      color: const Color(0xff757575),
                    )),
              ),
              Expanded(
                child: FutureBuilder<List<Product>>(
                  future: productslist,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Color(0xff007AFF),
                      ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No Products Found"));
                    } else {
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 29,
                                crossAxisSpacing: 15,
                                mainAxisExtent: 209),
                        itemBuilder: (context, index) {
                          return ProductCard(product: snapshot.data![index]);
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
