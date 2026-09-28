import 'package:fpdart/fpdart.dart';

import '../error/exception_mapper.dart';
import 'api_result.dart';

/// Runs a data-source call and maps any thrown error to a `Left(Failure)`,
/// so repository methods are one line each.
ApiResult<T> guard<T>(Future<T> Function() call) async {
  try {
    return Right(await call());
  } catch (e, s) {
    return Left(ExceptionMapper.map(e, s));
  }
}
