import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SocialAuthRepository {
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithApple();

  Future<Either<Failure, UserEntity>> signInWithGitHub();
}
