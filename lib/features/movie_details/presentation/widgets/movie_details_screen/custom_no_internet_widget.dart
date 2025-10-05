import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/network/cubit/network_cubit.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomNoInternetWidget extends StatelessWidget {
  final bool showExitButton;
  const CustomNoInternetWidget({
    super.key,
    this.showExitButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 50,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).noInternetConnection,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              context.read<NetworkCubit>().checkNetwork();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    S.of(context).tryAgain,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          showExitButton
              ? TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).exit,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
