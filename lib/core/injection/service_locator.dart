import 'package:balinasoft_test/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initDependencies() async {
  http.Client httpClient = http.Client();
  sl.registerSingleton<http.Client>(httpClient);

  sl.registerSingleton<AuthRemoteDataSource>((AuthRemoteDataSourceImpl(sl())));
}
