import 'package:get/get.dart';
import 'package:test_task_SoftCent/app/network/API_CALL/product_list_api.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var isLoading = false.obs;
  var products = [].obs;

  @override
  void onInit() {
    super.onInit();
    productsController();
  }

  void productsController() async {
    isLoading(true);
    try{
      var allProducts = await ProductListAPI().getProducts();
      if(allProducts != null){
        products.assignAll(allProducts);
      }
    } finally {isLoading(false);}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
