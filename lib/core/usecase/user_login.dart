// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements Usecase<User, userLoginParams> {
  final AuthRepository authRepository;

  const UserLogin(
    this.authRepository,
  );
  @override
  Future<Either<Failure, User>> call(userLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password
    );
  }
}

class userLoginParams {
  final String email;
  final String password;

  userLoginParams({
    required this.email,
    required this.password,
  });
}
