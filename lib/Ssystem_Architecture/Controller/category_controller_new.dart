import 'package:get/get.dart';
import 'package:softminion/API%20Service/category_service.dart';
import 'package:softminion/Ssystem_Architecture/Model/category_data_model_new.dart';

class CategoryController extends GetxController {
//  final CategoryService _categoryService = CategoryService();

  var categories = <Category>[].obs;
  var selectedCategory = Rx<Category?>(null);
  var expandedSubCategories = <SubCategory>[].obs;
  var selectedSubCategory = Rx<SubCategory?>(null);

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    isLoading.value = true;
    try {
      // categories.value = await _categoryService.fetchCategories();
      await Future.delayed(Duration(seconds: 2));
      categories.value = [
        Category(
          name: 'Electronics',
          image: 'assets/images/bike.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              image: 'assets/images/phone.png',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Private Car',
          image: 'assets/images/car.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              //  image: 'https://via.placeholder.com/50',
              image: 'assets/images/carSub.png',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Computers',
          image: 'assets/images/computer.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              image: 'assets/images/helmat.png',

              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Home LifeStyle',
          image: 'assets/images/man.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              //  image: 'https://via.placeholder.com/50',
              image: 'assets/images/carSub.png',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              image: 'assets/images/helmat.png',

              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              image: 'assets/images/phoneColor.png',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              image: 'assets/images/helmat.png',

              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Watch',
          image: 'assets/images/watch.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Man Fation',
          image: 'assets/images/motorbike.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Motor Bikes',
          image: 'assets/images/car.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Private Car',
          image: 'assets/images/car.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Private Car',
          image: 'assets/images/car.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Private Car',
          image: 'assets/images/car.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Private Car',
          image: 'assets/images/car.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
          name: 'Private Car',
          image: 'assets/images/car.png',
          subCategories: [
            SubCategory(
              name: 'Mobile',
              // image: 'https://via.placeholder.com/50',
              subProducts: [
                SubProduct(
                    name: 'iPhone', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'Samsung Galaxy',
                    image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                SubProduct(
                    name: 'OnePlus', image: 'https://via.placeholder.com/50'),
              ],
            ),
          ],
        ),
        Category(
            name: 'Private Car',
            image: 'assets/images/car.png',
            subCategories: [
              SubCategory(
                name: 'Mobile',
                // image: 'https://via.placeholder.com/50',
                subProducts: [
                  SubProduct(
                      name: 'iPhone', image: 'https://via.placeholder.com/50'),
                  SubProduct(
                      name: 'Samsung Galaxy',
                      image: 'https://via.placeholder.com/50'),
                  SubProduct(
                      name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                  SubProduct(
                      name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                  SubProduct(
                      name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                  SubProduct(
                      name: 'OnePlus', image: 'https://via.placeholder.com/50'),
                ],
              ),
            ])
      ];
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(Category category) {
    selectedCategory.value = category;
    expandedSubCategories.clear();
  }

  void toggleSubCategory(SubCategory subCategory) {
    if (expandedSubCategories.contains(subCategory)) {
      expandedSubCategories.remove(subCategory);
    } else {
      expandedSubCategories.add(subCategory);
    }
  }
}
