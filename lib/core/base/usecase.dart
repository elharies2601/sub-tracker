import 'package:fpdart/fpdart.dart';
import '../error/failures.dart';

/// Generic base for all use cases.
/// [Type] = return type, [Params] = input params.
abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// For use cases with no input params
class NoParams {
  const NoParams();
}
