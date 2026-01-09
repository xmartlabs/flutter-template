import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/gen/locale_keys.g.dart';
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
            title: Text(
              LocaleKeys.sign_in_test.tr(),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: _SignInForm()),
              if (context.read<SignInCubit>().state.error.isNotEmpty)
                Text(
                  LocaleKeys.error.tr(
                    namedArgs: {
                      'text': context.read<SignInCubit>().state.error,
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: TextButton(
                  onPressed: () => context.read<SignInCubit>().signIn(),
                  child: Text(LocaleKeys.sign_in.tr()),
                ),
              ),
            ],
          ),
        ),
      );
}

class _SignInForm extends StatefulWidget {
  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  late SignInCubit _signInCubit;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _signInCubit = context.read<SignInCubit>();
    // TODO: This should be bound
    _emailTextController.text = _signInCubit.state.email ?? '';
    _passwordTextController.text = _signInCubit.state.password ?? '';
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailTextController,
              onChanged: (String text) => _signInCubit.changeEmail(text),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: LocaleKeys.mail.tr(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: _passwordTextController,
              onChanged: (String password) =>
                  _signInCubit.changePassword(password),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: LocaleKeys.password.tr(),
              ),
            ),
          ),
        ],
      );
}
