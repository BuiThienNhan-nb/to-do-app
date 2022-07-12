import 'package:to_do_app/features/note/data/datasources/note_remote_data_source.dart';
import 'package:to_do_app/features/note/data/repositories/note_repository_imp.dart';
import 'package:to_do_app/features/note/domain/repositories/note_repositories.dart';
import 'package:to_do_app/features/note/domain/usecases/note_use_case.dart';

import '../../../../../core/injection/injection_container.dart';

class NoteInjectionContainer extends InjectionContainer {
  NoteInjectionContainer._internal();

  static final NoteInjectionContainer instance =
      NoteInjectionContainer._internal();

  @override
  Future<void> init() async {
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
      () => NoteRemoteDataSourceImp(dio: getIt()),
    );
  }
}
