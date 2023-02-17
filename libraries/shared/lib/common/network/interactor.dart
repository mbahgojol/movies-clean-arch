import 'package:dartz/dartz.dart';
import 'package:shared/common/network/result.dart';

abstract class Interactor<P> {
  Future<Result<Unit>> call(P params) async {
    Either<Exception, Unit> exceptionOrSuccess;
    try {
      await doWork(params);
      exceptionOrSuccess = right(unit);
    } on Exception catch (e) {
      exceptionOrSuccess = left(e);
    }
    return optionOf(exceptionOrSuccess);
  }

  Future<void> doWork(P params);
}
