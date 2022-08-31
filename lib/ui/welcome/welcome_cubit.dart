import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_cubit.freezed.dart';
part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeBaseState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final ProjectRepository _projectRepository = DiProvider.get();

  StreamSubscription? _projectsSubscription;

  WelcomeCubit() : super(WelcomeBaseState.state()) {
    _initStreams();
  }

  void _initStreams() {
    // TODO: Handle errors
    _projectsSubscription = _projectRepository
        .getProjects()
        .filterSuccess()
        .listen((projects) => emit(state.copyWith(projects: projects ?? [])));
  }

  @override
  Future<void> close() async {
    await _projectsSubscription?.cancel();
    await super.close();
  }

  Future<void> logOut() => _sessionRepository.logOut().mapToResult();
}
