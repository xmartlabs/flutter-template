import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/source/auth_local_source.dart';
import 'package:flutter_template/core/source/auth_remote_source.dart';
import 'package:flutter_template/core/source/common/http_service.dart';
import 'package:flutter_template/core/source/common/local_shared_preferences_storage.dart';
import 'package:flutter_template/core/source/project_local_source.dart';
import 'package:flutter_template/core/source/project_remote_source.dart';
import 'package:flutter_template/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:mocktail/mocktail.dart';

//* Services
class HttpServiceMock extends Mock implements HttpService {}

//* Data sources
class ProjectLocalSourceMock extends Mock implements ProjectLocalSource {}

class ProjectRemoteSourceMock extends Mock implements ProjectRemoteSource {}

class AuthLocalSourceMock extends Mock implements AuthLocalSource {}

class AuthRemoteSourceMock extends Mock implements AuthRemoteSource {}

//* Repositories
class MockSessionRepository extends Mock implements SessionRepository {}

class MockProjectRepository extends Mock implements ProjectRepository {}

//* Cubits
class MockGlobalEventHandlerCubit extends MockCubit<GlobalEventHandlerState>
    implements GlobalEventHandlerCubit {}

class LocalSharedPreferencesStorageMock extends Mock
    implements LocalSharedPreferencesStorage {}
