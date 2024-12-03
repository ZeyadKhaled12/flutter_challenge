import '../../../../core/network/error/failure.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../../data/models/order_model.dart';
import '../repository/base_orders_repo.dart';

import 'package:either_dart/either.dart';

class GetOrdersUc extends BaseUseCase<List<OrderModel>, NoParameters> {
  final BaseOrdersRepo baseOrdersRepo;

  GetOrdersUc(this.baseOrdersRepo);

  @override
  Future<Either<Failure, List<OrderModel>>> call(
      NoParameters parameters) async {
    return await baseOrdersRepo.getOrders(parameters);
  }
}
