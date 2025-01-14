import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/core/fp/either.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:meet_gpt_mobile/domain/models/dto/meet_request_dto.dart';
import 'package:meet_gpt_mobile/domain/providers/meet/meet_provider.dart';
import 'package:meet_gpt_mobile/domain/services/meet_service.dart';
import 'package:meet_gpt_mobile/domain/services/meet_service_impl.dart';

class MeetProviderImpl extends ChangeNotifier implements MeetProvider {
  List<Meet> list = [];

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Meet obj = Meet.empty();
  MeetRequestDto dto = MeetRequestDto.empty();

  final MeetService _service = MeetServiceImpl();

  @override
  Future<void> delete() async {
    loading = true;
    final result = await _service.deleteById(obj.id);
    loading = false;
    switch (result) {
      case Success():
        obj = Meet.empty();
        return Future.value();
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }

  @override
  Future<void> findAll() async {
    loading = true;
    final result = await _service.findAll();
    loading = false;
    switch (result) {
      case Success(value: final resultList):
        list = resultList;
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }

  @override
  Future<void> create() async {
    loading = true;
    final result = await _service.create(dto);
    loading = false;
    switch (result) {
      case Success():
        obj = result.value;
        return Future.value();
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }

  @override
  Future<void> update() async {
    loading = true;
    final result = await _service.update(obj);
    loading = false;
    switch (result) {
      case Success():
        return Future.value();
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }
}
