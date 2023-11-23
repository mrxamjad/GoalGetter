import 'package:flutter/material.dart';

class IconsData extends StatelessWidget {
  const IconsData({
    super.key,
    required this.name,
    required this.iconsName,
    required this.ipressed,
  });

  final String name;
  final String iconsName;
  final VoidCallback ipressed;
  // final String colorsvalue;

  @override
  Widget build(BuildContext context) {
    // final NewEntryBlock newEntryBlock = Provider.of<NewEntryBlock>(context);
    return GestureDetector(
      onTap: () {
        // Select Task Times And Icons;
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 1, bottom: 1),
              child: Center(
                  child: InkWell(
                      onTap: ipressed,
                      child: Image.asset(
                        iconsName,
                        scale: 9,
                      ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 25,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                color: Colors.teal.shade300,
              ),
              child: Center(
                  child: Text(
                name,
                style: TextStyle(fontSize: 15, color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
