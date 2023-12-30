import 'dart:convert';

import 'package:flutter/foundation.dart';

class Cat {
  final String name;
  final String pic;
  final String description;
  final String date;
  final List<Noti> notifications;
  Cat({
    required this.name,
    required this.pic,
    required this.description,
    required this.date,
    required this.notifications,
  });

  Cat copyWith({
    String? name,
    String? pic,
    String? description,
    String? date,
    List<Noti>? notifications,
  }) {
    return Cat(
      name: name ?? this.name,
      pic: pic ?? this.pic,
      description: description ?? this.description,
      date: date ?? this.date,
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pic': pic,
      'description': description,
      'date': date,
      'notifications': notifications.map((x) => x.toMap()).toList(),
    };
  }

  factory Cat.fromMap(Map<String, dynamic> map) {
    return Cat(
      name: map['name'] ?? '',
      pic: map['pic'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      notifications: List<Noti>.from(
          map['notifications']?.map((x) => Noti.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cat.fromJson(String source) => Cat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cat(name: $name, pic: $pic, description: $description, date: $date, notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cat &&
        other.name == name &&
        other.pic == pic &&
        other.description == description &&
        other.date == date &&
        listEquals(other.notifications, notifications);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        pic.hashCode ^
        description.hashCode ^
        date.hashCode ^
        notifications.hashCode;
  }
}

class Noti {
  final int id;
  final String message;
  Noti({
    required this.id,
    required this.message,
  });

  Noti copyWith({
    int? id,
    String? message,
  }) {
    return Noti(
      id: id ?? this.id,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
    };
  }

  factory Noti.fromMap(Map<String, dynamic> map) {
    return Noti(
      id: map['id']?.toInt() ?? 0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Noti.fromJson(String source) =>
      Noti.fromMap(json.decode(source));

  @override
  String toString() => 'Noti(id: $id, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Noti && other.id == id && other.message == message;
  }

  @override
  int get hashCode => id.hashCode ^ message.hashCode;
}
