import 'package:either_dart/either.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../../data/models/order_model.dart';

abstract class BaseOrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getOrders(NoParameters parameters);
}
