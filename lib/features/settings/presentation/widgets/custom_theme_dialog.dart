import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/theme/cubit/theme_cubit.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomThemeDialog extends StatelessWidget {
  const CustomThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            S.of(context).selectTheme,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            trailing: context.watch<ThemeCubit>().state.toString() ==
                    ThemeMode.light.toString()
                ? const Icon(CupertinoIcons.checkmark,
                    color: Color.fromARGB(255, 21, 86, 129))
                : null,
            title: Text(S.of(context).light,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(CupertinoIcons.sun_min, color: Colors.yellow),
            onTap: () {
              context.read<ThemeCubit>().changeTheme(ThemeMode.light);
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            trailing: context.watch<ThemeCubit>().state.toString() ==
                    ThemeMode.dark.toString()
                ? const Icon(CupertinoIcons.checkmark,
                    color: Color.fromARGB(255, 21, 86, 129))
                : null,
            title: Text(S.of(context).dark,
                style: const TextStyle(
                  color: Colors.white,
                )),
            leading: const Icon(CupertinoIcons.moon, color: Colors.blue),
            onTap: () {
              context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pop(context);
              });
            },
          ),
        ]));
  }
}
