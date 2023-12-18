import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_provider.dart';
import 'package:flutter_template/ui/signin/signin_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) =>
            SignInProvider(context.read<GlobalEventHandlerProvider>()),
        child: _SignInContentScreen(),
      );
}

class _SignInContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.localizations.sign_in),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: _SignInForm()),
            if (context.read<SignInProvider>().error.isNotEmpty)
              Text(
                context.localizations
                    .error(context.read<SignInProvider>().error),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: TextButton(
                onPressed: () => context.read<SignInProvider>().signIn(),
                child: Text(context.localizations.sign_in),
              ),
            ),
          ],
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
  late SignInProvider _signInProvider;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _signInProvider = context.read<SignInProvider>();
    // TODO: This should be bound
    _emailTextController.text = _signInProvider.email;
    _passwordTextController.text = _signInProvider.password;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailTextController,
              onChanged: (String text) => _signInProvider.changeEmail(text),
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
              controller: _passwordTextController,
              onChanged: (String password) =>
                  _signInProvider.changePassword(password),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.localizations.password,
              ),
            ),
          ),
        ],
      );
}
