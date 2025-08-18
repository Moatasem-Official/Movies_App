import 'package:flutter/material.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/images/1852.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
