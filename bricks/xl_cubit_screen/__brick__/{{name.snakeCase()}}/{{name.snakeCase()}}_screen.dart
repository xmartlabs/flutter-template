import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '{{name.snakeCase()}}_cubit.dart';

@RoutePage()
class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => {{name.pascalCase()}}Cubit(),
        child: _{{name.pascalCase()}}ContentScreen(),
      );
}

class _{{name.pascalCase()}}ContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container();
}
