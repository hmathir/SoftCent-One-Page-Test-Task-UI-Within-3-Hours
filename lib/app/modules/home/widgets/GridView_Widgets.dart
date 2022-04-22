import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:test_task_SoftCent/app/modules/home/controllers/home_controller.dart';

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) => index % 9 == 3
              ? StaggeredTile.count(2, 2)
              : StaggeredTile.count(1, 1),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          itemCount: controller.products.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Get.defaultDialog(
                    title: 'Overview',
                    backgroundColor: Colors.white,
                    content: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.products[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                          Text('Price: ' +
                                              controller.products[index].price.toString() + ' USD', style: TextStyle(color: Colors.black45, fontSize: 13),),
                                        ],
                                      )),
                                  Expanded(flex: 1, child: Icon(Icons.favorite))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Center(
                                  child: Image.network(
                                    controller.products[index].thumbnail,
                                    height: 234,
                                    width: 234,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                    child:           ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xffF4F5F7),
                                        onPrimary: Colors.black,

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0)),
                                        minimumSize: Size(234, 44), //////// HERE
                                      ),
                                      onPressed: () {},
                                      child: Text('Details'),
                                    )
                                ))
                          ],
                        )));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    controller.products[index].thumbnail,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return Center(child: child);
                      }
                      return Center(
                          child: Platform.isAndroid
                              ? CircularProgressIndicator()
                              : CupertinoActivityIndicator());
                    },
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          }),
    );
  }
}