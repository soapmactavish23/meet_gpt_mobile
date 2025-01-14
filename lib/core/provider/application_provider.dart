import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meet_gpt_mobile/core/provider/group/group_provider_impl.dart';
import 'package:meet_gpt_mobile/core/provider/user/user_provider_impl.dart';

class ApplicationProvider extends StatelessWidget {
  final Widget materialApp;
  const ApplicationProvider({super.key, required this.materialApp});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProviderImpl(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => GroupProviderImpl(),
          lazy: false,
        ),
      ],
      child: materialApp,
    );
  }
}
