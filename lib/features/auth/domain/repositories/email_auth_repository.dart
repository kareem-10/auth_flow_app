import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EmailAuthRepository {
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> resetPassword({required String email});

  Future<Either<Failure, void>> verifyEmail({required String token});

  Future<Either<Failure, void>> sendMagicLink({required String email});
}
