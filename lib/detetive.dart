import 'package:get_it/get_it.dart';
import 'api.dart';
import 'testeCRUD.dart';

GetIt detetive = GetIt();

void detetiveSetup(String colecao) {
  detetive.registerLazySingleton(() => Api(colecao));
  detetive.registerLazySingleton(() => CRUDteste());
}
