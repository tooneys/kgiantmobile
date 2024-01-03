import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/categories/category_repository.dart';
import 'package:kgiantmobile/src/features/insight/models/category_model.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class CategoryContorller extends GetxController {
  static CategoryContorller get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- load category data
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featureCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      KLoaders.errorSnackBar(title: '에러', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// load selected category data
  /// get category or sub-category products
}
