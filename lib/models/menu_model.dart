// ignore_for_file: public_member_api_docs, sort_constructors_first
class MenuModel {
  final String image;
  final String title;
  MenuModel({
    required this.image,
    required this.title,
  });
}

List<MenuModel> menuList = [
  MenuModel(image: "assets/coffee.png", title: "Coffee"),
  MenuModel(image: "assets/drink-water.png", title: "water"),
  MenuModel(image: "assets/breakfast.png", title: "breakfast"),
  MenuModel(image: "assets/sweet.png", title: "sweets"),
  MenuModel(image: "assets/teapot.png", title: "tea"),
  MenuModel(image: "assets/wine.png", title: "jus"),
];
