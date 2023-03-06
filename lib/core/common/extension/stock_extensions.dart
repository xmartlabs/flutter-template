//ignore_for_file: unused-files, unused-code
import 'package:flutter_template/core/common/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stock/stock.dart';

extension StockStreamExtensions<T> on Stream<StockResponse<T>> {
  Stream<Result<T>> flatMapToResult() => flatMap((response) async* {
        if (response.isData) {
          yield Result.success(response.requireData());
        } else if (response.isError) {
          yield Result.failure((response as StockResponseError).error);
        }
      });

  Stream<T> filterSuccessStockResponseData([
    Function(Object?, StackTrace?)? errorHandler,
  ]) =>
      flatMap((response) async* {
        if (response.isData) {
          yield response.requireData();
        } else if (response.isError) {
          final stockError = response as StockResponseError;
          errorHandler?.call(stockError.error, stockError.stackTrace);
        }
      });
}
