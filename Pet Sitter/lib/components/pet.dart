import 'dart:convert';


import 'package:flutter/foundation.dart';

class Customer {
  final String name;
  final String email;
  final String phone;
  final List<Pet> pets;
  final List<Favourite> favourites;
  Customer({
    required this.name,
    required this.email,
    required this.phone,
    required this.pets,
    required this.favourites,
  });

  Customer copyWith({
    String? name,
    String? email,
    String? phone,
    List<Pet>? pets,
    List<Favourite>? favourites,
  }) {
    return Customer(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      pets: pets ?? this.pets,
      favourites: favourites ?? this.favourites,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'pets': pets.map((x) => x.toMap()).toList(),
      'favourites': favourites.map((x) => x.toMap()).toList(),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      pets: List<Pet>.from(map['pets']?.map((x) => Pet.fromMap(x))),
      favourites: List<Favourite>.from(
          map['favourites']?.map((x) => Favourite.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(name: $name, email: $email, phone: $phone, pets: $pets, favourites: $favourites)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        listEquals(other.pets, pets) &&
        listEquals(other.favourites, favourites);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        pets.hashCode ^
        favourites.hashCode;
  }
}

class Pet {
  final String name;
  final int age;
  final String gender;
  final String species;
  final String pic; // Define the 'pic' parameter here

  Pet({
    required this.name,
    required this.age,
    required this.gender,
    required this.species,
    required this.pic, // Include it in the constructor parameters
  });

  Pet copyWith({
    String? name,
    int? age,
    String? gender,
    String? species,
  }) {
    return Pet(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      species: species ?? this.species,
      pic: pic,
  
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'species': species,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      gender: map['gender'] ?? '',
      species: map['species'] ?? '',
      pic: map['pic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pet(name: $name, age: $age, gender: $gender, species: $species)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pet &&
        other.name == name &&
        other.age == age &&
        other.gender == gender &&
        other.species == species;
  }

  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode ^ gender.hashCode ^ species.hashCode;
  }
}

class Favourite {
  final String name;
  final String service;
  final int rate;
  final double distance;
  final int feedback;
  final String pic;
  Favourite({
    required this.name,
    required this.service,
    required this.rate,
    required this.distance,
    required this.feedback,
    required this.pic,
  });

  Favourite copyWith({
    String? name,
    String? service,
    int? rate,
    double? distance,
    int? feedback,
    String? pic,
  }) {
    return Favourite(
      name: name ?? this.name,
      service: service ?? this.service,
      rate: rate ?? this.rate,
      distance: distance ?? this.distance,
      feedback: feedback ?? this.feedback,
      pic: pic ?? this.pic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'service': service,
      'rate': rate,
      'distance': distance,
      'feedback': feedback,
      'pic': pic,
    };
  }

  factory Favourite.fromMap(Map<String, dynamic> map) {
    return Favourite(
      name: map['name'] ?? '',
      service: map['service'] ?? '',
      rate: map['rate']?.toInt() ?? 0,
      distance: map['distance']?.toDouble() ?? 0.0,
      feedback: map['feedback']?.toInt() ?? 0,
      pic: map['pic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Favourite.fromJson(String source) =>
      Favourite.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Favourite(name: $name, service: $service, rate: $rate, distance: $distance, feedback: $feedback, pic: $pic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favourite &&
        other.name == name &&
        other.service == service &&
        other.rate == rate &&
        other.distance == distance &&
        other.feedback == feedback &&
        other.pic == pic;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        service.hashCode ^
        rate.hashCode ^
        distance.hashCode ^
        feedback.hashCode ^
        pic.hashCode;
  }
}
