import 'package:flutter/material.dart';
import 'package:meet_gpt_mobile/core/components/lists/not_found.dart';
import 'package:meet_gpt_mobile/core/components/utils/card_custom_icon.dart';
import 'package:meet_gpt_mobile/core/constants/constants.dart';
import 'package:meet_gpt_mobile/core/routes/router_name.dart';
import 'package:meet_gpt_mobile/core/utils/date_time_formatter.dart';
import 'package:meet_gpt_mobile/domain/providers/meet/meet_provider_impl.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      context.read<MeetProviderImpl>().findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MeetProviderImpl>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet GPT'),
      ),
      body: ChangeNotifierProvider.value(
        value: provider,
        builder: (_, __) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.list.isEmpty) {
            return const NotFound();
          } else {
            return ListView.builder(
              itemCount: provider.list.length,
              itemBuilder: (context, index) {
                final meet = provider.list[index];
                return CardCustomIcon(
                  icon: const Icon(
                    Icons.mic,
                    size: 30,
                    color: ColorsConstants.defaultColor,
                  ),
                  title: meet.name,
                  subtitle: Text(meet.date.convertYYYYMMDDHHMMSS()),
                  onTap: () {
                    Navigator.of(context).pushNamed(RouterName.meetDetail, arguments: meet);
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(RouterName.meetForm);
        },
      ),
    );
  }
}
