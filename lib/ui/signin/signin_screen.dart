import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';

import 'package:flutter_template/ui/signin/signin_cubit.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            SignInCubit(context.read<GlobalEventHandlerCubit>()),
        child: _SignInContentScreen(),
      );
}

class _SignInContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SignInCubit, SignInBaseState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(context.localizations.sign_in),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: _SignInForm()),
              if (context.read<SignInCubit>().state.error.isNotEmpty)
                Text(
                  context.localizations
                      .error(context.read<SignInCubit>().state.error),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: TextButton(
                  onPressed: () => context.read<SignInCubit>().signIn(),
                  child: Text(context.localizations.sign_in),
                ),
              ),
            ],
          ),
        ),
      );
}

class _SignInForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();
    // TODO: This should be bound
    final emailTextController =
        useTextEditingController(text: signInCubit.state.email ?? '');
    final passwordTextController =
        useTextEditingController(text: signInCubit.state.password ?? '');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailTextController,
            onChanged: (String text) => signInCubit.changeEmail(text),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: context.localizations.mail,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            controller: passwordTextController,
            onChanged: (String password) =>
                signInCubit.changePassword(password),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: context.localizations.password,
            ),
          ),
        ),
      ],
    );
  }
}
