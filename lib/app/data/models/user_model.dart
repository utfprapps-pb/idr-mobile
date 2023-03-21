// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id;
  final String username;
  final String cpf;
  final String county;
  final String cep;
  final String street;
  final int number;
  final String phone;
  final String email;
  final String professionalRegister;
  final String graduationYear;

  UserModel({
    required this.id,
    required this.username,
    required this.cpf,
    required this.county,
    required this.cep,
    required this.street,
    required this.number,
    required this.phone,
    required this.email,
    required this.professionalRegister,
    required this.graduationYear,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? cpf,
    String? county,
    String? cep,
    String? street,
    int? number,
    String? phone,
    String? email,
    String? professionalRegister,
    String? graduationYear,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      cpf: cpf ?? this.cpf,
      county: county ?? this.county,
      cep: cep ?? this.cep,
      street: street ?? this.street,
      number: number ?? this.number,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      professionalRegister: professionalRegister ?? this.professionalRegister,
      graduationYear: graduationYear ?? this.graduationYear,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'cpf': cpf,
      'county': county,
      'cep': cep,
      'street': street,
      'number': number,
      'phone': phone,
      'email': email,
      'professionalRegister': professionalRegister,
      'graduationYear': graduationYear,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      username: map['username'] as String,
      cpf: map['cpf'] as String,
      county: map['county'] as String,
      cep: map['cep'] as String,
      street: map['street'] as String,
      number: map['number'] as int,
      phone: map['phone'] as String,
      email: map['email'] as String,
      professionalRegister: map['professionalRegister'] as String,
      graduationYear: map['graduationYear'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, cpf: $cpf, county: $county, cep: $cep, street: $street, number: $number, phone: $phone, email: $email, professionalRegister: $professionalRegister, graduationYear: $graduationYear)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.cpf == cpf &&
        other.county == county &&
        other.cep == cep &&
        other.street == street &&
        other.number == number &&
        other.phone == phone &&
        other.email == email &&
        other.professionalRegister == professionalRegister &&
        other.graduationYear == graduationYear;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        cpf.hashCode ^
        county.hashCode ^
        cep.hashCode ^
        street.hashCode ^
        number.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        professionalRegister.hashCode ^
        graduationYear.hashCode;
  }
}
