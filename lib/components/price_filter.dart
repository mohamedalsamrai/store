import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:intl/intl.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  SfRangeValues _values = const SfRangeValues(40.0, 80.0);
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  @override
  void initState() {
    startController.text = '\$0';
    endController.text = '\$0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Price",
            style: TextStyle(
                fontFamily: 'Poppins Medium',
                fontSize: 15,
                color: Color(0xff000000)),
          ),
          const SizedBox(
            height: 30,
          ),
          SfRangeSlider(
            inactiveColor: const Color.fromARGB(87, 0, 123, 255),
            activeColor: const Color(0xff007AFF),
            numberFormat: NumberFormat("\$"),
            minorTicksPerInterval: 10,
            min: 0,
            max: 100,
            values: _values,
            showTicks: true,
            showLabels: false,
            enableTooltip: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
                startController.text = " \$${values.start.toInt().toString()}";
                endController.text = " \$${values.end.toInt().toString()}";
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceField(controller: startController),
                const Text(
                  "__",
                  style: TextStyle(fontSize: 15),
                ),
                PriceField(controller: endController)
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 50,
      child: TextField(
        style: const TextStyle(
            color: Color(
              0xff8B8B8B,
            ),
            fontSize: 16),
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff8B8B8B)),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
