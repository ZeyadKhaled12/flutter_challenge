import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../core/network/error/error_message_model.dart';
import '../../../../core/network/error/exception.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../../../../core/utils/assets_manager.dart';
import '../models/order_model.dart';

abstract class BaseOrdersLocalDataSource {
  Future<List<OrderModel>> getOrders(NoParameters parameters);
}

class OrdersLocalDataSource extends BaseOrdersLocalDataSource {
  @override
  Future<List<OrderModel>> getOrders(NoParameters parameters) async {
    // simulate Api call
    await Future.delayed(const Duration(seconds: 2));
    try {
      final String response = await rootBundle.loadString(JsonAsset.orders);
      return (jsonDecode(response) as List)
          .map(
            (e) => OrderModel.fromJson(e),
          )
          .toList();
    } catch (e) {
      throw ServerException(ErrorMessageModel(statusMessage: e.toString()));
    }
  }
}
