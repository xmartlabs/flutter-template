import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/project.dart';
import 'package:flutter_template/core/repository/project_repository.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/section/error_handler/cubit/global_event_handler_cubit.dart';

class WelcomeProvider extends ChangeNotifier {
  List<Project> _projects = [];
  final SessionRepository _sessionRepository = DiProvider.get();
  final ProjectRepository _projectRepository = DiProvider.get();

  final GlobalEventHandler? _globalEventHandler;

  StreamSubscription? _projectsSubscription;

  List<Project> get projects => _projects;

  WelcomeProvider(this._globalEventHandler) {
    _projectsSubscription = _projectRepository
        .getProjects()
        .filterSuccess(_globalEventHandler?.handleError)
        .listen((projects) {
      _projects = projects ?? [];
      notifyListeners();
    });
  }

  Future<void> logOut() => _sessionRepository.logOut().mapToResult();

  @override
  void dispose() {
    _projectsSubscription?.cancel();
    super.dispose();
  }
}
