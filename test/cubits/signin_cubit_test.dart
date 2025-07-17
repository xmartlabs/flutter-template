import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/signin/signin_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../common/cubit_mocks.dart';
import '../common/data_mocks.dart';

void main() {
  late GetIt getIt;
  late SessionRepository sessionRepository;
  late SignInCubit signInCubit;

  setUp(() {
    getIt = DiProvider.instance
      ..registerSingleton<SessionRepository>(
        sessionRepository = MockSessionRepository(),
      );
  });
  tearDown(() => getIt.reset());

  test('Create SignInCubit should return base state', () {
    signInCubit = SignInCubit(MockGlobalEventHandlerCubit());

    expect(
      signInCubit.state,
      equals(
        const SignInBaseState.state(
          email: 'hi@xmartlabs.com',
          password: 'xmartlabs',
          error: '',
        ),
      ),
    );
  });

  blocTest(
    'SignInCubit change email should return state with new email',
    build: () => signInCubit = SignInCubit(MockGlobalEventHandlerCubit()),
    act: (bloc) => bloc.changeEmail('hitest@xmartlabs.com'),
    expect: () => [
      const SignInBaseState.state(
        email: 'hitest@xmartlabs.com',
        password: 'xmartlabs',
        error: '',
      ),
    ],
  );

  blocTest(
    'SignInCubit change password should return state with new password',
    build: () => signInCubit = SignInCubit(MockGlobalEventHandlerCubit()),
    act: (bloc) => bloc.changePassword('xmartlabs123'),
    expect: () => [
      const SignInBaseState.state(
        email: 'hi@xmartlabs.com',
        password: 'xmartlabs123',
        error: '',
      ),
    ],
  );

  blocTest(
    'SignInCubit signIn method should call signInUser in repository',
    setUp: () {
      when(
        () => sessionRepository.signInUser(
          email: 'hi@xmartlabs.com',
          password: 'xmartlabs',
        ),
      ).thenAnswer((_) async {});
    },
    build: () => signInCubit = SignInCubit(MockGlobalEventHandlerCubit()),
    act: (bloc) => bloc.signIn(),
    verify: (_) {
      verify(
        () => sessionRepository.signInUser(
          email: 'hi@xmartlabs.com',
          password: 'xmartlabs',
        ),
      ).called(1);
    },
  );
}
