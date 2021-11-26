import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            title: Text('Logged user'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Hi ${state.name}', style: TextStyle(fontSize: 18)),
                TextButton(
                    onPressed: () => context.read<WelcomeCubit>().logOut(),
                    child: Text('Log out', style: TextStyle(fontSize: 18)))
              ],
            ),
          ),
        );
      });
}
