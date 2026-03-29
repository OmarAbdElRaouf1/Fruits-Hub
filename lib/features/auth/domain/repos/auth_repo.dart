import 'package:dartz/dartz.dart';
import 'package:fruits_market/core/errors/errors.dart';
import 'package:fruits_market/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<AppError, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
