import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/phone_auth_datasource.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/phone_auth_repository.dart';

class PhoneAuthRepositoryImpl implements PhoneAuthRepository {
  final PhoneAuthDataSource _phoneAuthDataSource;

  PhoneAuthRepositoryImpl({required PhoneAuthDataSource phoneAuthDataSource})
    : _phoneAuthDataSource = phoneAuthDataSource;

  @override
  Future<Either<Failure, void>> sendOTP({required String phoneNumber}) async {
    try {
      await _phoneAuthDataSource.sendOTP(phoneNumber: phoneNumber);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyOTP({
    required String phoneNumber,
    required String otpCode,
  }) async {
    try {
      final user = await _phoneAuthDataSource.verifyOTP(
        phoneNumber: phoneNumber,
        otpCode: otpCode,
      );
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
