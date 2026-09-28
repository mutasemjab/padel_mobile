import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

/// Every repository method returns this — Left(failure) or Right(data).
/// Blocs map it straight into an Error/Loaded state and never see a thrown exception.
typedef ApiResult<T> = Future<Either<Failure, T>>;
