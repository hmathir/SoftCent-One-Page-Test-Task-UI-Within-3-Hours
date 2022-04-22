import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_SoftCent/app/modules/home/controllers/home_controller.dart';
import 'package:test_task_SoftCent/app/modules/home/widgets/GridView_Widgets.dart';
import 'package:test_task_SoftCent/app/modules/home/widgets/Search_Box_Widgets.dart';
import 'package:test_task_SoftCent/app/modules/home/widgets/navigationBar.dart';


class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: navigationBar, //Want to change or Add anything? Check "navigationBar.dart" from Widgets directory.
        body: SafeArea(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return Center(
                    child: Platform.isAndroid
                        ? CircularProgressIndicator()
                        : CupertinoActivityIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBoxWidgets(),
                    Divider(thickness: 1),
                    CustomGridViewWidget(controller: controller),
                  ],
                ),
              );
            },
          ),
        ),
    );
  }
}


