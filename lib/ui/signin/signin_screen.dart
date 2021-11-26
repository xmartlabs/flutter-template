import 'package:flutter_template/ui/signin/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc(),
      child: _SignInContentScreen(),
    );
  }
}

class _SignInContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Sign in'),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: _SignInForm()),
              if (context.read<SignInBloc>().state.error.isNotEmpty)
                Text('Error: ${context.read<SignInBloc>().state.error}'),
              TextButton(
                  onPressed: () =>
                      context.read<SignInBloc>().add(SignInEvent.login()),
                  child: Text('Sign in'))
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
  late SignInBloc _signInBlock;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _signInBlock = context.read<SignInBloc>();
    // TODO: This should be bound
    _emailTextController.text = _signInBlock.state.email ?? '';
    _passwordTextController.text = _signInBlock.state.password ?? '';
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
              onChanged: (String text) =>
                  _signInBlock.add(SignInEvent.changeEmail(email: text)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mail',
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
            onChanged: (String password) => _signInBlock
                .add(SignInEvent.changePassword(password: password)),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          )),
        ),
      ],
    );
  }
}
