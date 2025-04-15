import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jioyathri/features/authentication/data/datasources/auth_datasource.dart';
import 'package:jioyathri/features/authentication/data/datasources/auth_localstorage.dart';
import 'package:jioyathri/features/authentication/data/datasources/service_datasource.dart';
import 'package:jioyathri/features/authentication/data/models/user_model.dart';
import 'package:jioyathri/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:jioyathri/features/authentication/data/repositories/service_repository_impl.dart';
import 'package:jioyathri/features/authentication/domain/repositories/auth_repository.dart';
import 'package:jioyathri/features/authentication/domain/repositories/service_repositiry.dart';
import 'package:jioyathri/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:jioyathri/features/authentication/domain/usecases/service_usecases.dart';
import 'package:jioyathri/features/authentication/presentation/provider/auth_provider.dart';
import 'package:jioyathri/features/authentication/presentation/provider/services_provider.dart';
import 'package:jioyathri/features/onboarding/data/datasources/onboarding_localstorage.dart';
import 'package:jioyathri/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:jioyathri/features/onboarding/domain/repositories/onboarding_repositories.dart';
import 'package:jioyathri/features/onboarding/domain/usecases/onboarding_usecase.dart';
import 'package:jioyathri/features/onboarding/presentation/provider/onboarding_provider.dart';

final getIt = GetIt.instance;

Future<void> setuplocator() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await AuthLocalstorage().init();

  //datasourcs
  getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasource());
  getIt.registerLazySingleton<AuthLocalstorage>(() => AuthLocalstorage());
  getIt.registerLazySingleton<ServiceDatasource>(() => ServiceDatasource());
  getIt.registerLazySingleton<OnboardingLocalstorage>(
    () => OnboardingLocalstorage(),
  );

  //repository
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(getIt<AuthDatasource>(), getIt<AuthLocalstorage>()),
  );
  getIt.registerLazySingleton<ServiceRepositiry>(
    () => ServiceRepositoryImpl(getIt<ServiceDatasource>()),
  );
  getIt.registerLazySingleton<OnboardingRepositories>(
    () => OnboardingRepositoryImpl(getIt<OnboardingLocalstorage>()),
  );

  //usecases
  getIt.registerLazySingleton<RegisterUserUsecase>(
    () => RegisterUserUsecase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LoginUserUsecase>(
    () => LoginUserUsecase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetServicesUsecase>(
    () => GetServicesUsecase(getIt<ServiceRepositiry>()),
  );
  getIt.registerLazySingleton<GetOnboardingStatusUsecase>(
    () => GetOnboardingStatusUsecase(getIt<OnboardingRepositories>()),
  );
  getIt.registerLazySingleton<SetOnboardingStatusUsecase>(
    () => SetOnboardingStatusUsecase(getIt<OnboardingRepositories>()),
  );

  //provider
  getIt.registerLazySingleton<AuthProvider>(
    () => AuthProvider(
      getIt<RegisterUserUsecase>(),
      getIt<LoginUserUsecase>(),
      getIt<GetUserUsecase>(),
    ),
  );

  getIt.registerLazySingleton<ServicesProvider>(
    () => ServicesProvider(getIt<GetServicesUsecase>()),
  );

  getIt.registerLazySingleton(
    () => OnboardingProvider(
      getIt<GetOnboardingStatusUsecase>(),
      getIt<SetOnboardingStatusUsecase>(),
    ),
  );
}
