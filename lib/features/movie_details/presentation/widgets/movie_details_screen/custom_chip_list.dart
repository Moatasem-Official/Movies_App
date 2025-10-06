import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class CustomChipList extends StatelessWidget {
  final String title;
  final List<String> items;

  const CustomChipList({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        items.isEmpty
            ? Center(
                child: Text(S.of(context).noTitledFound(title),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 233, 233, 233),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              )
            : Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: items
                    .map(
                      (item) => Chip(
                        label: Text(item),
                        backgroundColor: Colors.white.withOpacity(0.1),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        side: BorderSide(color: Colors.white.withOpacity(0.2)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}
