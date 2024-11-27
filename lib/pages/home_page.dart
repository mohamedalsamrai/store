import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/components/product_card.dart';
import 'package:store/components/search_text_feild.dart';
import 'package:store/models/product.dart';
import 'package:store/services/products_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slect = 0;
  Future<List<Product>>? products_list;

  List<String> types = ["Laptops", "PC Components", "Mouses", "Keyboards"];
  @override
  void initState() {
    products_list = ProductsService().getProducts();
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
                            setState(() {});
                          },
                          child: Text(
                            "${types[index]}",
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
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/filter.svg",
                      width: 25,
                      height: 25,
                      color: const Color(0xff757575),
                    )),
              ),
              Expanded(
                child: FutureBuilder<List<Product>>(
                  future: products_list,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Color(0xff007AFF),
                      ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text("No Products Found"));
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
