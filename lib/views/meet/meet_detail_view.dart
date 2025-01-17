import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/domain/models/class/meet.dart';
import 'package:audioplayers/audioplayers.dart';

class MeetDetailView extends StatefulWidget {
  final Meet meet;
  const MeetDetailView({super.key, required this.meet});

  @override
  _MeetDetailViewState createState() => _MeetDetailViewState();
}

class _MeetDetailViewState extends State<MeetDetailView> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(
        UrlSource(widget.meet.url),
      );
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Reunião'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: _playPauseAudio,
                    ),
                    const SizedBox(width: 10),
                    const Text('Áudio da reunião'),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                height: 40,
              ),
              const Text(
                'Resumo da reunião',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.meet.summary,
              ),
              const Divider(
                thickness: 2,
                height: 40,
              ),
              const Text(
                'Transcrição do Áudio',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.meet.translate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
