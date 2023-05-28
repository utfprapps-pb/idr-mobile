import 'dart:convert';

import 'package:get/get.dart';

//baseUrl para conectar em localhost via emulador
const baseUrlEmulador = 'http://10.0.2.2:8080/';
//baseUrl para conectar em localhost via dispositivo fisico
// const baseUrlDevice = 'http://192.168.2.112:8080/';
const baseUrlDevice = 'http://192.168.2.105:8080/';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = baseUrlEmulador;
    httpClient.timeout = Duration(seconds: 60);
  }
}
