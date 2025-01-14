
import 'package:meet_gpt_mobile/core/exception/repository_exception.dart';
import 'package:meet_gpt_mobile/core/fp/either.dart';
import 'package:meet_gpt_mobile/core/fp/nil.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:meet_gpt_mobile/domain/models/dto/meet_request_dto.dart';

mixin MeetRepository {
  Future<Either<RepositoryException, Meet>> create(MeetRequestDto dto);
  Future<Either<RepositoryException, Meet>> update(Meet meet);
  Future<Either<RepositoryException, Nil>> deleteById(int id);
  Future<Either<RepositoryException, List<Meet>>> findAll();
}