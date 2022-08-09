import 'dart:async';

import 'package:rxdart/transformers.dart';

class Store<T> {
  final Fetcher<T> _fetcher;
  final SourceOfTruth<T> _sourceOfTruth;

  Store({required Fetcher<T> fetcher, required SourceOfTruth<T> sourceOfTruth})
      : _fetcher = fetcher,
        _sourceOfTruth = sourceOfTruth;

  Stream<T?> _streamFromStreamFetcher(StreamFetcher<T> fetcher) {
    var streamSubscription = fetcher.fetch().listen(_sourceOfTruth.writer);
    return _sourceOfTruth
        .reader()
        .doOnCancel(() => streamSubscription.cancel());
  }

  Stream<T?> _streamFromFutureFetcher(FutureFetcher<T> fetcher) {
    final fetchValueFuture = () async {
      final value = await fetcher.fetch();
      await _sourceOfTruth.writer(value);
    };

    unawaited(fetchValueFuture());
    return _sourceOfTruth.reader();
  }

  Stream<T?> stream() {
    if (_fetcher is FutureFetcher<T>) {
      return _streamFromFutureFetcher(_fetcher as FutureFetcher<T>);
    } else if (_fetcher is StreamFetcher<T>) {
      return _streamFromStreamFetcher(_fetcher as StreamFetcher<T>);
    } else {
      throw Exception('Fetcher is not valid');
    }
  }
}

abstract class Fetcher<T> {}

class FutureFetcher<T> extends Fetcher<T> {
  Future<T?> Function() fetch;

  FutureFetcher(this.fetch);
}

class StreamFetcher<T> extends Fetcher<T> {
  Stream<T?> Function() fetch;

  StreamFetcher(this.fetch);
}

class SourceOfTruth<T> {
  Stream<T?> Function() reader;
  Future<void> Function(T?) writer;

  SourceOfTruth({required this.reader, required this.writer});
}

class CachedSourceOfTruth<T> implements SourceOfTruth<T> {
  final _streamController = StreamController<T?>.broadcast();

  T? _cachedValue;

  @override
  late Stream<T?> Function() reader;
  @override
  late Future<void> Function(T?) writer;

  CachedSourceOfTruth() {
    reader = () async* {
      yield _cachedValue;
      yield* _streamController.stream;
    };
    writer = (value) async {
      _cachedValue = value;
      _streamController.add(value);
    };
  }
}
