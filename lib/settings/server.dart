class Server {
  static const serverIp = "192.168.0.14";
  static const serverPort = 3000;
  static String imageUrl = "$serverUrl/image";

  static String get serverUrl => "http://$serverIp:$serverPort";
  static String get bannerImgUrl => "$imageUrl/banner";
  static String get categoryImgUrl => "$imageUrl/category";
  static String get recipeImgUrl => "$imageUrl/recipe";
  static String get userImgUrl => "$imageUrl/user";
}
