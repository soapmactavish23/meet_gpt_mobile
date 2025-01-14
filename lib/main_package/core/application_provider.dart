import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationProvider extends StatelessWidget {
  final Widget materialApp;
  const ApplicationProvider({super.key, required this.materialApp});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
      ],
      child: materialApp,
    );
  }
}
