import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shadowColor: const Color.fromARGB(255, 165, 165, 216),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)),
      color: const Color(0xffffffff),
      child: TextField(
        cursorColor: const Color(0xff007AFF),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            hintStyle: const TextStyle(
              color: Color.fromARGB(168, 117, 117, 117),
              fontFamily: "Poppins Medium",
              fontSize: 17,
            ),
            hintText: "Search",
            suffixIcon: SvgPicture.asset(
              "assets/icons/search-line.svg",
              color: const Color(0xff8E8E93),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}