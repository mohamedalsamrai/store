import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  final String title, buttomName;
  const FilterCard({
    super.key,
    required this.title,
    required this.buttomName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xffffffff), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Poppins Medium',
                fontSize: 15,
                color: Color(0xff000000)),
          ),
          GestureDetector(
            child: Text(
              buttomName,
              style: const TextStyle(
                  fontFamily: 'Poppins Medium',
                  fontSize: 13,
                  color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}