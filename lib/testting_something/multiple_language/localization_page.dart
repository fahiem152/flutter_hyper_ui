import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hyper_ui/testting_something/multiple_language/local_provider.dart';
import 'package:provider/provider.dart';

class LocalizationPages extends StatelessWidget {
  const LocalizationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LocalizationPages"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(AppLocalizations.of(context)!.intro + " Ahmad"),
              Text(AppLocalizations.of(context)!.country + " Indonesia"),
              Text(AppLocalizations.of(context)!.language + " Indonesia"),
              Text(AppLocalizations.of(context)!.city + " Semarang"),
              Text(AppLocalizations.of(context)!.year + " 2024"),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<LocaleProvider>().setLocale(Locale('en')),
                  child: Text('English'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<LocaleProvider>().setLocale(Locale('id')),
                  child: Text('Indonesia'),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
