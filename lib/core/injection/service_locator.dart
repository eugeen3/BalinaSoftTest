import 'package:balinasoft_test/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:balinasoft_test/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:balinasoft_test/features/auth/data/repository/auth_repository_impl.dart';
import 'package:balinasoft_test/features/auth/domain/repository/auth_repository.dart';
import 'package:balinasoft_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:balinasoft_test/features/photos/data/datasource/photos_local_datasource.dart';
import 'package:balinasoft_test/features/photos/data/datasource/photos_remote_datasource.dart';
import 'package:balinasoft_test/features/photos/data/repository/photos_repository_impl.dart';
import 'package:balinasoft_test/features/photos/domain/repository/photos_repository.dart';
import 'package:balinasoft_test/features/photos/presentation/cubit/photos_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  http.Client httpClient = http.Client();
  sl.registerSingleton<http.Client>(httpClient);

  sl.registerSingleton<AuthRemoteDataSource>((AuthRemoteDataSourceImpl(sl())));
  sl.registerSingleton<AuthLocalDataSource>((AuthLocalDataSourceImpl(sl())));

  sl.registerSingleton<AuthRepository>((AuthRepositoryImpl(sl(), sl())));

  sl.registerSingleton<AuthCubit>((AuthCubit(sl())));

  sl.registerSingleton<PhotosRemoteDataSource>((PhotosRemoteDataSourceImpl(sl())));
  sl.registerSingleton<PhotosLocalDataSource>((PhotosLocalDataSourceImpl()));

  sl.registerSingleton<PhotosRepository>((PhotosRepositoryImpl(sl(), sl())));

  sl.registerSingleton<PhotosCubit>((PhotosCubit(sl())));
}
