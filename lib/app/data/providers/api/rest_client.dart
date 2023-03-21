import 'dart:convert';

import 'package:get/get.dart';

//baseUrl para conectar em localhost via emulador
const baseUrl = '10.2.2.2:8080';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = baseUrl;
  }
}
