// import '../../../../../core/injection/injection_container.dart';
// import '../../../data/datasources/note_remote_data_source.dart';
// import '../../../data/repositories/note_repository_imp.dart';
// import '../../../presentation/bloc/note_bloc.dart';
// import '../../repositories/note_repositories.dart';
// import '../note_use_case.dart';

// class NoteInjectionContainer extends InjectionContainer {
//   NoteInjectionContainer._internal();

//   static final NoteInjectionContainer instance =
//       NoteInjectionContainer._internal();

//   @override
//   Future<void> init() async {
//     getIt.registerFactory<NoteBloc>(() => NoteBloc(getIt()));

//     getIt.registerLazySingleton<NoteUseCase>(
//       () => NoteUseCase(getIt()),
//     );

//     getIt.registerLazySingleton<NoteRepository>(
//       () => NoteRepositoryImp(
//         noteRemoteDataSource: getIt(),
//         networkStatus: getIt(),
//       ),
//     );

//     getIt.registerLazySingleton<NoteRemoteDataSource>(
//       () => NoteRemoteDataSourceImp(),
//     );
//   }
// }

import 'package:to_do_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:to_do_app/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:to_do_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:to_do_app/features/auth/domain/usecases/auth_use_case.dart';
import 'package:to_do_app/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../../core/injection/injection_container.dart';

class AuthInjectionContainer extends InjectionContainer {
  AuthInjectionContainer._internal();

  static final AuthInjectionContainer instance =
      AuthInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt()));

    getIt.registerLazySingleton<AuthUseCase>(
      () => AuthUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(
        authRemoteDataSource: getIt(),
        networkStatus: getIt(),
      ),
    );

    getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
  }
}
