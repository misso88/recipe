class Category {
  String ct_name;
  String ct_img;

  Category({required this.ct_name, required this.ct_img});

  factory Category.fromJson(Map<String, dynamic> json) {
    // 팩토리 패턴
    return Category(
      ct_name: json["ct_name"] as String,
      ct_img: json["ct_img"] as String,
    );
  }
}
