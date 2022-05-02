class Recipe {
  int rp_seq;
  String rp_title;
  String? rp_contents;
  String? rp_img1;
  String? rp_img2;
  String? rp_img3;
  String? rp_img4;
  String rp_share_yn;
  int rp_view_cnt;
  int rp_like_cnt;
  String rp_crdate;
  String rp_uddate;

  String us_img;
  String us_nickname;
  String ct_img;
  int rl_seq;

  Recipe({
    required this.rp_seq,
    required this.rp_title,
    required this.rp_contents,
    required this.rp_img1,
    required this.rp_img2,
    required this.rp_img3,
    required this.rp_img4,
    required this.rp_share_yn,
    required this.rp_view_cnt,
    required this.rp_like_cnt,
    required this.rp_crdate,
    required this.rp_uddate,
    required this.us_img,
    required this.us_nickname,
    required this.ct_img,
    required this.rl_seq,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    // 팩토리 패턴
    return Recipe(
      rp_seq: json["rp_seq"] as int,
      rp_title: json["rp_title"] as String,
      rp_contents: json["rp_contents"] as String,
      rp_img1: json["rp_img1"] as String,
      rp_img2: json["rp_img2"] as String,
      rp_img3: json["rp_img3"] as String,
      rp_img4: json["rp_img4"] as String,
      rp_share_yn: json["rp_share_yn"] as String,
      rp_view_cnt: json["rp_view_cnt"] as int,
      rp_like_cnt: json["rp_like_cnt"] as int,
      rp_crdate: json["rp_crdate"] as String,
      rp_uddate: json["rp_uddate"] as String,
      us_img: json["us_img"] as String,
      us_nickname: json["us_nickname"] as String,
      ct_img: json["ct_img"] as String,
      rl_seq: json["rl_seq"] as int,
    );
  }
}
