import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/auth/domain/entities/user.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkStatus networkStatus;

  AuthRepositoryImp({
    required this.authRemoteDataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    try {
      return Right(await authRemoteDataSource.signIn(email, password));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    try {
      return Right(await authRemoteDataSource.signOut());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(
      String name, String email, String password) async {
    if (!await networkStatus.isConnected) return Left(UserFailure());
    try {
      return Right(await authRemoteDataSource.signUp(name, email, password));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
