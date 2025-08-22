import 'package:flutter/material.dart';

class CustomVideoScreenAppBar extends StatelessWidget {
  const CustomVideoScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              image: AssetImage('assets/images/1852.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 5,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(100),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
