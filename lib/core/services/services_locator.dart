import 'package:get_it/get_it.dart';

import '../../features/orders/data/datasource/orders_local_data_source.dart';
import '../../features/orders/data/repository/orders_repo.dart';
import '../../features/orders/domain/repository/base_orders_repo.dart';
import '../../features/orders/domain/usecases/get_orders_uc.dart';
import '../../features/orders/presentation/controller/orders_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => OrdersBloc(sl()));

    //orders usecases
    sl.registerLazySingleton(() => GetOrdersUc(sl()));

    //Repo
    sl.registerLazySingleton<BaseOrdersRepo>(() => OrdersRepo(sl()));

    //Data Source
    sl.registerLazySingleton<BaseOrdersLocalDataSource>(
        () => OrdersLocalDataSource());
  }
}
