import 'package:meet_gpt_mobile/core/exception/repository_exception.dart';
import 'package:meet_gpt_mobile/core/fp/either.dart';
import 'package:meet_gpt_mobile/core/fp/nil.dart';
import 'package:meet_gpt_mobile/core/auth/models/dto/password_dto.dart';
import 'package:meet_gpt_mobile/core/auth/models/dto/profile_dto.dart';
import 'package:meet_gpt_mobile/core/auth/models/token.dart';
import 'package:meet_gpt_mobile/core/auth/models/user.dart';

mixin UserRepository {
  Future<Either<RepositoryException, List<User>>> search({String name = '', String email = ''});
  Future<Either<RepositoryException, Nil>> resetPassword(String email);
  Future<Either<RepositoryException, Nil>> changePassword(PasswordDto passwordDTO);
  Future<Either<RepositoryException, Nil>> editProfile(ProfileDto profileDTO);

  Future<Either<RepositoryException, User>> create(User obj);

  Future<Either<RepositoryException, User>> update(User obj);

  Future<Either<RepositoryException, Nil>> deleteById(int id);

  Future<Either<RepositoryException, User>> findByCode(String code);

  Future<Either<RepositoryException, Token>> signIn(String email, String password);

}
