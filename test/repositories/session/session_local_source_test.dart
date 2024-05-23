// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_template/core/model/user.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/data_mocks.dart';

void main() {
  late LocalSharedPreferencesStorageMock storage;
  late AuthLocalSource authLocalSource;

  setUp(() {
    storage = LocalSharedPreferencesStorageMock();
    when(() => storage.init()).thenAnswer((_) => any());

    authLocalSource = AuthLocalSource(storage);
  });

  group('getUserToken tests', () {
    test('getUserToken when local Storage is empty, should return null',
        () async {
      when(() => storage.read(key: 'AuthLocalSource.token'))
          .thenAnswer((_) => Future.value(null));
      expect(await authLocalSource.getUserToken().first, null);
    });

    test('getUserToken when local Storage has data, should return String token',
        () async {
      when(() => storage.read(key: 'AuthLocalSource.token'))
          .thenAnswer((_) => Future.value('123abc'));
      expect(await authLocalSource.getUserToken().first, '123abc');
    });
  });

  test(
      'saveUserToken "123abc" when local Storage is empty, write method should be called once',
      () async {
    when(() => storage.write(key: 'AuthLocalSource.token', value: '123abc'))
        .thenAnswer((_) => Future(() => null));
    await authLocalSource.saveUserToken('123abc');
    verify(
      () => storage.write(
        key: 'AuthLocalSource.token',
        value: '123abc',
      ),
    );
  });

  test('getUser when local storage is empty should return empty', () async {
    when(() => storage.read(key: 'AuthLocalSource.user'))
        .thenAnswer((_) => Future(() => null));
    expect(await authLocalSource.getUser().first, null);
    verify(() => storage.read(key: 'AuthLocalSource.user')).called(1);
  });

  test('getUser when local storage has data, should return a user', () async {
    when(() => storage.read(key: 'AuthLocalSource.user')).thenAnswer(
      (_) => Future(
        () => '{"name": "Test user","email": "test@email.com"}',
      ),
    );
    expect((await authLocalSource.getUser().first)?.email, 'test@email.com');
    verify(() => storage.read(key: 'AuthLocalSource.user')).called(1);
  });

  test(
      'saveUserInfo with null in local storage,'
      ' should call write once and save null', () async {
    when(
      () => storage.write(
        key: 'AuthLocalSource.user',
        value: null,
      ),
    ).thenAnswer((_) => Future(() => null));

    await authLocalSource.saveUserInfo(
      null,
    );
    verify(() => storage.write(key: 'AuthLocalSource.user', value: null))
        .called(1);
  });

  test(
      'saveUserInfo when local storage is empty,'
      ' should call write once', () async {
    when(
      () => storage.write(
        key: 'AuthLocalSource.user',
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) => Future(() => null));

    await authLocalSource.saveUserInfo(
      User(
        name: 'Test user',
        email: 'test@email.com',
      ),
    );
    verify(
      () => storage.write(
        key: 'AuthLocalSource.user',
        value: any(named: 'value'),
      ),
    ).called(1);
  });
}
