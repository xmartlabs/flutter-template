import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/task.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/core/repository/task_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_cubit.freezed.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeBaseState> {
  final SessionRepository _sessionRepository = DiProvider.get();
  final TaskRepository _taskRepository = DiProvider.get();

  StreamSubscription? _userSubscription;
  StreamSubscription? _tasksSubscription;

  WelcomeCubit() : super(WelcomeBaseState.state()) {
    _initStreams();
  }

  void _initStreams() {
    // TODO: Handle errors
    _userSubscription = _sessionRepository
        .getUserInfo()
        .filterSuccess()
        .listen((user) => emit(state.copyWith(userName: user?.name)));
    _tasksSubscription = _taskRepository
        .getTasks()
        .filterSuccess()
        .listen((tasks) => emit(state.copyWith(tasks: tasks ?? [])));
  }

  @override
  Future<void> close() async {
    await _userSubscription?.cancel();
    await _tasksSubscription?.cancel();
    await super.close();
  }

  Future<void> logOut() => _sessionRepository.logOut().mapToResult();
}
