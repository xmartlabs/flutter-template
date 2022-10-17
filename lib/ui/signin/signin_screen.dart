import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/error_handler_cubit.dart';

import 'package:flutter_template/ui/signin/signin_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(context.read<ErrorHandlerCubit>()),
      child: _SignInContentScreen(),
    );
  }
}

class _SignInContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInBaseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.localizations.sign_in),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: _SignInForm()),
              if (context.read<SignInCubit>().state.error.isNotEmpty)
                Text(context.localizations
                    .error(context.read<SignInCubit>().state.error)),
              TextButton(
                  onPressed: () => context.read<SignInCubit>().signIn(),
                  child: Text(context.localizations.sign_in))
            ],
          ),
        );
      },
    );
  }
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: TextField(
              controller: _emailTextController,
              onChanged: (String text) => _signInCubit.changeEmail(text),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: context.localizations.mail,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: TextField(
            obscureText: true,
            controller: _passwordTextController,
            onChanged: (String password) =>
                _signInCubit.changePassword(password),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: context.localizations.password,
            ),
          )),
        ),
      ],
    );
  }
}
