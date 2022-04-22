import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchBoxWidgets extends StatelessWidget {
  const SearchBoxWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 17.0, right: 17.0, bottom: 26.0),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(IconlyLight.search),
            hintText: 'Search in Swipexyz..',
            filled: true,
            fillColor: Color(0xffF4F5F7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}