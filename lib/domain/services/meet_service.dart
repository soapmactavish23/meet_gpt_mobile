import 'package:meet_gpt_mobile/core/exception/service_exception.dart';
import 'package:meet_gpt_mobile/core/fp/either.dart';
import 'package:meet_gpt_mobile/core/fp/nil.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:meet_gpt_mobile/domain/models/dto/meet_request_dto.dart';

abstract interface class MeetService {
  Future<Either<ServiceException, Meet>> create(MeetRequestDto dto);
  Future<Either<ServiceException, Meet>> update(Meet meet);
  Future<Either<ServiceException, Nil>> deleteById(int id);
  Future<Either<ServiceException, List<Meet>>> findAll();
}