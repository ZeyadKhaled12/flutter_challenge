import 'package:either_dart/either.dart';

import '../../../../core/network/error/exception.dart';
import '../../../../core/network/error/failure.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../../domain/repository/base_orders_repo.dart';
import '../datasource/orders_local_data_source.dart';
import '../models/order_model.dart';

class OrdersRepo extends BaseOrdersRepo {
  final BaseOrdersLocalDataSource baseOrdersLocalDataSource;

  OrdersRepo(this.baseOrdersLocalDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(
      NoParameters parameters) async {
    try {
      final result = await baseOrdersLocalDataSource.getOrders(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure.openFun(failure.errorMessageModel.statusMessage));
    }
  }
}
