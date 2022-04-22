import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

  var navigationBar = ConvexAppBar(
    initialActiveIndex: 1,
    color: Colors.black,
    backgroundColor: Colors.white,
    activeColor: Colors.orange,
    curveSize: 10000,
    elevation: 0,
    height: 50,
    style: TabStyle.fixedCircle,
    items: [
      TabItem(icon: IconlyLight.home, title: 'Home'),
      TabItem(
        icon: IconlyLight.discovery,
        title: 'Explore',
      ),
      TabItem(icon: Icons.add, title: ''),
      TabItem(icon: IconlyLight.message, title: 'Inbox'),
      TabItem(icon: IconlyLight.bag_2, title: 'Shop'),
    ]);