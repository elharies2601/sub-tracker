import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/app_settings.dart';

abstract interface class AppSettingsRepository {
  Future<Either<Failure, AppSettings>> load();
  Future<Either<Failure, AppSettings>> save(AppSettings settings);
}
