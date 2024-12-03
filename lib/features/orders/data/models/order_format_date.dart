import 'package:equatable/equatable.dart';

class OrderFormatDate extends Equatable {
  final String month;
  final int count;

  const OrderFormatDate({required this.month, required this.count});

  @override
  List<Object?> get props => [month, count];
}
