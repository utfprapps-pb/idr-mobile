// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class LoginModel {
  final String token;
  final String username;
  final String displayName;
  final List authorities;

  LoginModel({
    required this.token,
    required this.username,
    required this.displayName,
    required this.authorities,
  });

  LoginModel copyWith({
    String? token,
    String? username,
    String? displayName,
    List? authorities,
  }) {
    return LoginModel(
      token: token ?? this.token,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      authorities: authorities ?? this.authorities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'username': username,
      'displayName': displayName,
      'authorities': authorities,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      token: map['token'] as String,
      username: map['user']['username'] as String,
      displayName: map['user']['displayName'] as String,
      authorities: List.from((map['user']['authorities']) as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginModel(token: $token, username: $username, displayName: $displayName, authorities: $authorities)';
  }

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.username == username &&
        other.displayName == displayName &&
        listEquals(other.authorities, authorities);
  }

  @override
  int get hashCode {
    return token.hashCode ^
        username.hashCode ^
        displayName.hashCode ^
        authorities.hashCode;
  }
}
