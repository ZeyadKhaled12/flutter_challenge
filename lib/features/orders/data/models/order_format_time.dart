import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OrderFormatTime extends Equatable {
  final TimeOfDay timeOfDay;
  final int count;

  const OrderFormatTime({required this.timeOfDay, required this.count});

  @override
  List<Object?> get props => [timeOfDay, count];
}
