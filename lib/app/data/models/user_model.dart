// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id;
  final String username;
  final String displayName;
  final String cpf;
  final String county;
  final String cep;
  final String street;
  final String houseNumber;
  final String phone;
  final String professionalRegister;
  final String graduationYear;

  UserModel({
    required this.id,
    required this.username,
    required this.displayName,
    required this.cpf,
    required this.county,
    required this.cep,
    required this.street,
    required this.houseNumber,
    required this.phone,
    required this.professionalRegister,
    required this.graduationYear,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? displayName,
    String? cpf,
    String? county,
    String? cep,
    String? street,
    String? houseNumber,
    String? phone,
    String? professionalRegister,
    String? graduationYear,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      cpf: cpf ?? this.cpf,
      county: county ?? this.county,
      cep: cep ?? this.cep,
      street: street ?? this.street,
      houseNumber: houseNumber ?? this.houseNumber,
      phone: phone ?? this.phone,
      professionalRegister: professionalRegister ?? this.professionalRegister,
      graduationYear: graduationYear ?? this.graduationYear,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'displayName': displayName,
      'cpf': cpf,
      'county': county,
      'cep': cep,
      'street': street,
      'houseNumber': houseNumber,
      'phone': phone,
      'professionalRegister': professionalRegister,
      'graduationYear': graduationYear,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      username: map['username'] as String,
      displayName: map['displayName'] as String,
      cpf: map['cpf'] as String,
      county: map['county'] as String,
      cep: map['cep'] as String,
      street: map['street'] as String,
      houseNumber: map['houseNumber'] as String,
      phone: map['phone'] as String,
      professionalRegister: map['professionalRegister'] as String,
      graduationYear: map['graduationYear'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, displayName: $displayName, cpf: $cpf, county: $county, cep: $cep, street: $street, houseNumber: $houseNumber, phone: $phone, professionalRegister: $professionalRegister, graduationYear: $graduationYear)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.displayName == displayName &&
        other.cpf == cpf &&
        other.county == county &&
        other.cep == cep &&
        other.street == street &&
        other.houseNumber == houseNumber &&
        other.phone == phone &&
        other.professionalRegister == professionalRegister &&
        other.graduationYear == graduationYear;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        displayName.hashCode ^
        cpf.hashCode ^
        county.hashCode ^
        cep.hashCode ^
        street.hashCode ^
        houseNumber.hashCode ^
        phone.hashCode ^
        professionalRegister.hashCode ^
        graduationYear.hashCode;
  }
}
