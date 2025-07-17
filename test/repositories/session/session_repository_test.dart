// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/model/service/auth_models.dart';
import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/data_mocks.dart';
import '../../common/general_helpers.dart';

void main() {
  late AuthLocalSource authLocalSource;
  late AuthRemoteSource authRemoteSource;
  late SessionRepository sessionRepository;
  late Directory tempDir;

  setUp(() async {
    authLocalSource = AuthLocalSourceMock();
    authRemoteSource = AuthRemoteSourceMock();
    tempDir = initHive();
    sessionRepository = SessionRepository(authLocalSource, authRemoteSource);
  });
  tearDown(() async => closeHive(tempDir));

  group('status stream tests', () {
    test(
      'Get Authenticated status from repository with token stored, should return Authenticated',
      () async {
        when(() => authLocalSource.getUserToken()).thenAnswer(
          (_) => Stream.value('123abc'),
        );
        expect(
          await sessionRepository.status.first,
          AuthenticationStatus.authenticated,
        );
      },
    );
    test(
      'Get Unauthenticated status from repository with null token stored, should return Unauthenticated',
      () async {
        when(() => authLocalSource.getUserToken()).thenAnswer(
          (_) => Stream.value(null),
        );
        expect(
          await sessionRepository.status.first,
          AuthenticationStatus.unauthenticated,
        );
      },
    );
  });

  group('getUserInfo tests', () {
    test('getUserInfo when localSource is empty, should return null', () async {
      when(() => authLocalSource.getUser())
          .thenAnswer((_) => Stream.value(null));
      expect(await sessionRepository.getUserInfo().first, null);
    });
    test('getUserInfo when localSource has data, should return a User',
        () async {
      when(() => authLocalSource.getUser()).thenAnswer(
        (_) => Stream.value(User(email: 'test@email', name: 'Test')),
      );
      expect(
        (await sessionRepository.getUserInfo().first)?.email,
        'test@email',
      );
    });
  });
  group('signInUser tests', () {
    test(
        'signInUser when the data is valid should consume the remote source and call saveUserToken and saveUserInfo from local source',
        () async {
      when(
        () => authRemoteSource.signIn(
          'test@email.com',
          '123456',
        ),
      ).thenAnswer(
        (_) async => SignInResponse(
          accessToken: '123abc',
          user: User(email: 'test@email.com', name: 'Test'),
        ),
      );

      when(
        () => authLocalSource.saveUserInfo(
          User(email: 'test@email.com', name: 'Test'),
        ),
      ).thenAnswer((_) async {});

      when(() => authLocalSource.saveUserToken('123abc'))
          .thenAnswer((_) async {});

      await sessionRepository.signInUser(
        email: 'test@email.com',
        password: '123456',
      );
      verify(
        () => authRemoteSource.signIn('test@email.com', '123456'),
      ).called(1);
      verify(
        () => authLocalSource
            .saveUserInfo(User(email: 'test@email.com', name: 'Test')),
      ).called(1);
      verify(
        () => authLocalSource.saveUserToken('123abc'),
      ).called(1);
    });

    test(
        'signInUser when the data is invalid should throw an exception and not call saveUserToken and saveUserInfo from local source',
        () async {
      when(
        () => authRemoteSource.signIn(
          any(),
          any(),
        ),
      ).thenThrow(
        const HttpException(''),
      );

      when(
        () => authLocalSource.saveUserInfo(
          any(),
        ),
      ).thenAnswer((_) async {});

      when(() => authLocalSource.saveUserToken(any())).thenAnswer((_) async {});

      expect(
        () => sessionRepository.signInUser(
          email: 'test',
          password: '123456',
        ),
        throwsA(isA<HttpException>()),
      );
      verifyNever(
        () => authLocalSource.saveUserInfo(any()),
      );
      verifyNever(
        () => authLocalSource.saveUserToken(any()),
      );
    });
  });

  test('logOut when there is data stored locally, should clean all data',
      () async {
    when(() => authLocalSource.saveUserToken(null)).thenAnswer((_) async {});
    when(() => authLocalSource.saveUserInfo(null)).thenAnswer((_) async {});

    await sessionRepository.logOut();
    verify(() => authLocalSource.saveUserToken(null)).called(1);
    verify(() => authLocalSource.saveUserInfo(null)).called(1);
  });
}
