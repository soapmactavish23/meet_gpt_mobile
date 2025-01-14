// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';

class MeetRequestDto {
  String name;
  File file;

  MeetRequestDto({
    required this.name,
    required this.file,
  });

  factory MeetRequestDto.empty() {
    return MeetRequestDto(name: '', file: File(''));
  }

  Future<FormData> toMap() async {
    return FormData.fromMap({
      'name': name,
      'file': await MultipartFile.fromFile(file.path),
    });
  }

  @override
  String toString() => 'MeetRequestDto(name: $name, file: $file)';
}
