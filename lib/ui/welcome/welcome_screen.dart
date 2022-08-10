import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/ui/welcome/welcome_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeCubit(),
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
            title: Text(AppLocalizations.of(context)!.logged_in),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        AppLocalizations.of(context)!
                            .user_message(state.userName ?? ''),
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 15),
                    Text(
                      AppLocalizations.of(context)!.pending_tasks,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    ...state.tasks.map(
                      (task) => Text(
                        '- ${task.description}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: TextButton(
                      onPressed: () => context.read<WelcomeCubit>().logOut(),
                      child: Text(AppLocalizations.of(context)!.log_out,
                          style: TextStyle(fontSize: 18))),
                ))
              ],
            ),
          ),
        );
      });
}
