class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://mgm1.dishtele.com/api/v1/";

  // receiveTimeout
  static const int receiveTimeout = 150000;

  // connectTimeout
  static const int connectionTimeout = 300000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";


  /// authintication
  static const String login = baseUrl + "users/login";

  static const String myWork = baseUrl + "daily_work/getListMyWork";
}