import 'package:dartz/dartz.dart';
import 'package:fruits_market/core/errors/errors.dart';
import 'package:fruits_market/core/errors/exceptions.dart';
import 'package:fruits_market/core/services/auth_service.dart';
import 'package:fruits_market/features/auth/data/models/user_model.dart';
import 'package:fruits_market/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;
  AuthRepoImpl({required this.authService});

  @override
  Future<Either<AppError, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerError(e.message));
    }
  }
}
