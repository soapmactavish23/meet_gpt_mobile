import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/domain/providers/meet/meet_provider_impl.dart';
import 'package:provider/provider.dart';

class ApplicationProvider extends StatelessWidget {
  final Widget materialApp;
  const ApplicationProvider({super.key, required this.materialApp});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MeetProviderImpl(),
          lazy: false,
        ),
      ],
      child: materialApp,
    );
  }
}
