import 'package:flutter_template/core/common/store/store.dart';

abstract class StoreConverter<T0, T1> {
  T1 fromT0(T0 t0);

  T0 fromT1(T1 t1);
}

extension SourceOfTruthExtensions<T> on SourceOfTruth<T> {
  SourceOfTruth<R> mapTo<R>(StoreConverter<T, R> converter) => SourceOfTruth<R>(
        reader: () =>
            reader().map((t) => t == null ? null : converter.fromT0(t)),
        writer: (t) => writer(t == null ? null : converter.fromT1(t)),
      );
}
