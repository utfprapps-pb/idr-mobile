class HeadersAPI {
  final token;

  HeadersAPI({this.token});
  Map<String, String> getHeaders() {
    print({
      "Content-Type": "application/json",
      "Accept-Charset": "UTF-8",
      "Authorization": "Bearer $token"
    });

    return {
      "Content-Type": "application/json",
      "Accept-Charset": "UTF-8",
      "Authorization": "Bearer $token"
    };
  }
}
