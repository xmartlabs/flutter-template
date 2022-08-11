import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/section/error_handler/error_handler_cubit.dart';
import 'package:flutter_template/ui/welcome/welcome_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(context.read<ErrorHandlerCubit>()),
      child: _WelcomeContentScreen(),
    );
  }
}

class _WelcomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<WelcomeCubit, WelcomeBaseState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Resources.localizations.logged_in),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Resources.localizations.user_message(state.name!),
                    style: TextStyle(fontSize: 18)),
                TextButton(
                    onPressed: () => context.read<WelcomeCubit>().logOut(),
                    child: Text(Resources.localizations.log_out,
                        style: TextStyle(fontSize: 18)))
              ],
            ),
          ),
        );
      });
}
