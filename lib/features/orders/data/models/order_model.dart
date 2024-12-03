import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/core/utils/enums.dart';

class OrderModel extends Equatable {
  final String? id;
  final bool? isActive;
  final double? price;
  final String? company;
  final String? picture;
  final String? buyer;
  final List<dynamic>? tags;
  final OrderStatus? status;
  final DateTime? registered;

  const OrderModel({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      isActive: json['isActive'] as bool?,
      price: convertPrice(json['price']),
      company: json['company'] as String?,
      picture: json['picture'] as String?,
      buyer: json['buyer'] as String?,
      tags: json['tags'] as List<dynamic>?,
      status: convertOrderStatus(json['status']),
      registered: json['registered'] == null
          ? null
          : DateTime.parse(json['registered']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'isActive': isActive,
        'price': price,
        'company': company,
        'picture': picture,
        'buyer': buyer,
        'tags': tags,
        'status': status,
        'registered': registered?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      isActive,
      price,
      company,
      picture,
      buyer,
      tags,
      status,
      registered,
    ];
  }
}

OrderStatus? convertOrderStatus(String? json) {
  return json == 'ORDERED'
      ? OrderStatus.ordered
      : json == 'DELIVERED'
          ? OrderStatus.delivered
          : json == 'RETURNED'
              ? OrderStatus.returned
              : null;
}

double? convertPrice(String? json) {
  if (json == null) return null;
  return double.parse(json.replaceAll(RegExp(r'[^\d.]'), ''));
}
