class RecipeIngredient {
  int ri_seq;
  int rp_seq;
  String ri_name;
  String ri_quantity;

  RecipeIngredient({
    required this.ri_seq,
    required this.rp_seq,
    required this.ri_name,
    required this.ri_quantity,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) {
    // 팩토리 패턴
    return RecipeIngredient(
      ri_seq: json["ri_seq"] as int,
      rp_seq: json["rp_seq"] as int,
      ri_name: json["ri_name"] as String,
      ri_quantity: json["ri_quantity"] as String,
    );
  }
}
