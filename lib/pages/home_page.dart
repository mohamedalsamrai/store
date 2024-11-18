import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slect = 0;

  List<String> types = ["Laptops", "PC Components", "Mouses", "Keyboards"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
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
                  "assets/fonts/icons/cart.svg",
                  width: 37,
                  height: 37,
                  color: Color(0xff757575),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 38, left: 15, right: 15),
          child: Column(
            children: [
              Card(
                elevation: 9,
                shadowColor: Color.fromARGB(255, 165, 165, 216),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: Color(0xffffffff),
                child: TextField(
                  cursorColor: Color(0xff007AFF),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      hintStyle: TextStyle(
                        color: Color.fromARGB(168, 117, 117, 117),
                        fontFamily: "Poppins Medium",
                        fontSize: 17,
                      ),
                      hintText: "Search",
                      suffixIcon: SvgPicture.asset(
                        "assets/fonts/icons/search-line.svg",
                        color: Color(0xff8E8E93),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              SizedBox(
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
                                    ? Color(0xff007AFF)
                                    : Color(0xff000000),
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
                      "assets/fonts/icons/filter.svg",
                      width: 25,
                      height: 25,
                      color: Color(0xff757575),
                    )),
              )
            ],
          ),
        ));
  }
}
