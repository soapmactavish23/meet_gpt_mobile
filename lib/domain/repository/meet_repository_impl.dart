// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meet_gpt_mobile/core/exception/repository_exception.dart';
import 'package:meet_gpt_mobile/core/fp/either.dart';
import 'package:meet_gpt_mobile/core/fp/nil.dart';
import 'package:meet_gpt_mobile/core/rest_client/config/http_methods.dart';
import 'package:meet_gpt_mobile/core/rest_client/rest_client.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:meet_gpt_mobile/domain/models/dto/meet_request_dto.dart';
import 'package:meet_gpt_mobile/domain/repository/meet_repository.dart';

class MeetRepositoryImpl extends RestClient with MeetRepository {
  MeetRepositoryImpl();

  @override
  Future<Either<RepositoryException, Meet>> create(MeetRequestDto dto) async {
    try {
      final result = await unAuth.request(
        '/meet',
        data: dto.toMap(),
        options: Options(
          method: HttpMethods.post,
          headers: {
            Headers.contentTypeHeader: "multipart/form-data",
          },
          receiveTimeout: const Duration(minutes: 2),
        ),
      );

      return Success(Meet.fromMap(result.data));
    } catch (e, s) {
      const message = "Erro ao criar reunião";
      log(message, error: e, stackTrace: s);
      return Future.error(message);
    }
  }

  @override
  Future<Either<RepositoryException, List<Meet>>> findAll() async {
    try {
      final result = await unAuth.get('/meet');
      final list = List<Map<String, dynamic>>.from(result.data).toList();
      return Success(list.map<Meet>((m) => Meet.fromMap(m)).toList());
    } catch (e, s) {
      const message = "Erro ao listar reunião";
      log(message, error: e, stackTrace: s);
      return Future.error(message);
    }
  }

  @override
  Future<Either<RepositoryException, Meet>> update(Meet meet) async {
    try {
      final result = await unAuth.put(
        '/meet',
        data: meet.toJson(),
      );

      return Success(Meet.fromMap(result.data));
    } catch (e, s) {
      const message = "Erro ao atualizar reunião";
      log(message, error: e, stackTrace: s);
      return Future.error(message);
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> deleteById(int id) async {
    try {
      await unAuth.delete('/meet/$id');
      return Success(Nil());
    } catch (e, s) {
      const message = "Erro ao deletar reunião";
      log(message, error: e, stackTrace: s);
      return Future.error(message);
    }
  }
}
