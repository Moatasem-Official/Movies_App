import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/lang/cubit/locale_cubit.dart';
import '../../../../generated/l10n.dart';

class CustomLanguageDialog extends StatelessWidget {
  const CustomLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          S.of(context).selectLanguage,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          trailing: context.watch<LocaleCubit>().state.languageCode == 'en'
              ? const Icon(CupertinoIcons.checkmark,
                  color: Color.fromARGB(255, 21, 86, 129))
              : null,
          leading: const Icon(CupertinoIcons.globe,
              color: Color.fromARGB(255, 21, 86, 129)),
          onTap: () {
            context.read<LocaleCubit>().changeLocale(const Locale('en'));
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.pop(context);
            });
          },
          title: Text(
            S.of(context).english,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          trailing: context.watch<LocaleCubit>().state.languageCode == 'ar'
              ? const Icon(CupertinoIcons.checkmark,
                  color: Color.fromARGB(255, 21, 86, 129))
              : null,
          leading: const Icon(CupertinoIcons.globe,
              color: Color.fromARGB(255, 21, 86, 129)),
          onTap: () {
            context.read<LocaleCubit>().changeLocale(const Locale('ar'));
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.pop(context);
            });
          },
          title: Text(
            S.of(context).arabic,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
