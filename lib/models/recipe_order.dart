class RecipeOrder {
  int ro_seq;
  int rp_seq;
  int ro_order;
  String ro_contents;
  String ro_img;

  RecipeOrder({
    required this.ro_seq,
    required this.rp_seq,
    required this.ro_order,
    required this.ro_contents,
    required this.ro_img,
  });

  factory RecipeOrder.fromJson(Map<String, dynamic> json) {
    // 팩토리 패턴
    return RecipeOrder(
      ro_seq: json["ro_seq"] as int,
      rp_seq: json["rp_seq"] as int,
      ro_order: json["ro_order"] as int,
      ro_contents: json["ro_contents"] as String,
      ro_img: json["ro_img"] as String,
    );
  }
}
