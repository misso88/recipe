class Banner {
  String bn_img;

  Banner({required this.bn_img});

  factory Banner.fromJson(Map<String, dynamic> json) {
    // 팩토리 패턴
    return Banner(
      bn_img: json["bn_img"] as String,
    );
  }
}
