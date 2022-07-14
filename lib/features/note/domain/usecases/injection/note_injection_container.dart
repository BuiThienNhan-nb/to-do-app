import '../../../../../core/injection/injection_container.dart';
import '../../../data/datasources/note_remote_data_source.dart';
import '../../../data/repositories/note_repository_imp.dart';
import '../../../presentation/bloc/note_bloc.dart';
import '../../repositories/note_repositories.dart';
import '../note_use_case.dart';

class NoteInjectionContainer extends InjectionContainer {
  NoteInjectionContainer._internal();

  static final NoteInjectionContainer instance =
      NoteInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerFactory<NoteBloc>(() => NoteBloc(getIt()));

    getIt.registerLazySingleton<NoteUseCase>(
      () => NoteUseCase(getIt()),
    );

    getIt.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImp(
        noteRemoteDataSource: getIt(),
        networkStatus: getIt(),
      ),
    );

    getIt.registerLazySingleton<NoteRemoteDataSource>(
      () => NoteRemoteDataSourceImp(),
    );
  }
}
