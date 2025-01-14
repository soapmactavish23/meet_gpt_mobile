import 'package:meet_gpt_mobile/core/exception/service_exception.dart';
import 'package:meet_gpt_mobile/core/fp/either.dart';
import 'package:meet_gpt_mobile/core/fp/nil.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:meet_gpt_mobile/domain/models/dto/meet_request_dto.dart';
import 'package:meet_gpt_mobile/domain/repository/meet_repository.dart';
import 'package:meet_gpt_mobile/domain/repository/meet_repository_impl.dart';
import 'package:meet_gpt_mobile/domain/services/meet_service.dart';

class MeetServiceImpl implements MeetService {
  final MeetRepository _repository = MeetRepositoryImpl();

  @override
  Future<Either<ServiceException, Meet>> create(MeetRequestDto dto) async {
    final result = await _repository.create(dto);
    switch (result) {
      case Success(value: Meet obj):
        return Success(obj);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }

  @override
  Future<Either<ServiceException, Nil>> deleteById(int id) async {
    final result = await _repository.deleteById(id);
    switch (result) {
      case Success():
        return Success(Nil());
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }

  @override
  Future<Either<ServiceException, List<Meet>>> findAll() async {
    final result = await _repository.findAll();
    switch(result) {
      case Success(value: List<Meet> meets):
        return Success(meets);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }

  @override
  Future<Either<ServiceException, Meet>> update(Meet meet) async {
    final result = await _repository.update(meet);
    switch (result) {
      case Success(value: Meet obj):
        return Success(obj);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }
}
