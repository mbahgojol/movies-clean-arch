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

abstract class ResultInteractor<R> {
  Future<Result<R>> call() async {
    Either<Exception, R> exceptionOrSuccess;
    try {
      var result = await doWork();
      exceptionOrSuccess = right(result);
    } on Exception catch (e) {
      exceptionOrSuccess = left(e);
    }
    return optionOf(exceptionOrSuccess);
  }

  Future<R> doWork();
}

abstract class ResultInteractorWithParams<P, R> {
  Future<Result<R>> call(P params) async {
    Either<Exception, R> exceptionOrSuccess;
    try {
      var result = await doWork(params);
      exceptionOrSuccess = right(result);
    } on Exception catch (e) {
      exceptionOrSuccess = left(e);
    }
    return optionOf(exceptionOrSuccess);
  }

  Future<R> doWork(P params);
}
