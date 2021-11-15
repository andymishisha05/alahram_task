class Category {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final List<Category> subCategoryList;
  late Category? selectedSubCategory;

  Category(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.subCategoryList,
      this.selectedSubCategory});

  set selectSubCategory(Category category) {
    this.selectSubCategory = category;
  }
}
