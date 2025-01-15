import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:meet_gpt_mobile/core/components/forms/input_custom.dart';
import 'package:meet_gpt_mobile/core/components/images/image_custom.dart';
import 'package:meet_gpt_mobile/core/constants/constants.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:meet_gpt_mobile/domain/providers/meet/meet_provider_impl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class MeetFormView extends StatefulWidget {
  const MeetFormView({super.key});

  @override
  State<MeetFormView> createState() => _MeetFormViewState();
}

class _MeetFormViewState extends State<MeetFormView> {
  final nameEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Meet obj = Meet.empty();
  String title = "Nova Reunião";

  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool isRecording = false;
  File? recordedFile;

  @override
  void initState() {
    super.initState();
    initRecorder();

    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final provider = context.read<MeetProviderImpl>();
      setState(() {
        obj = provider.obj;
        title = obj.name == "" ? 'Nova Reunião' : obj.name;
      });
    });
  }

  Future<void> initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException("Microfone não permitido");
    }
    await recorder.openRecorder();
  }

  @override
  void dispose() {
    super.dispose();
    recorder.closeRecorder();
    nameEC.dispose();
  }

  Future<void> startRecording() async {
    await recorder.startRecorder(toFile: 'audio_file.aac');
  }

  Future<void> stopRecording() async {
    final filePath = await recorder.stopRecorder();
    if (filePath != null) {
      recordedFile = File(filePath);
      print("Arquivo gravado: ${recordedFile?.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  ImageConstants.logo,
                ),
                const SizedBox(
                  height: 10,
                ),
                InputCustom(
                  controller: nameEC,
                  hintText: "Digite o título da reunião",
                  label: "Nome da Reunião",
                  maxLength: 150,
                  icon: const Icon(Icons.description),
                  validator: Validatorless.required('Campo obrigatória'),
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (!isRecording) {
                          setState(() {
                            isRecording = true;
                          });
                          await startRecording();
                        } else {
                          await stopRecording();
                          setState(() {
                            isRecording = false;
                          });
                        }
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isRecording)
                          const SizedBox(
                            width: 160,
                            height: 160,
                            child: CircularProgressIndicator(
                              strokeWidth: 8,
                            ),
                          ),
                        const CircleAvatar(
                          radius: 80,
                          child: Icon(
                            Icons.mic,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
