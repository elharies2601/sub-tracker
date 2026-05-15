import 'package:fpdart/fpdart.dart';

import '../../../../core/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entities/app_settings.dart';
import '../repository/app_settings_repository.dart';

class LoadAppSettings implements UseCase<AppSettings, void> {
  final AppSettingsRepository _repo;
  const LoadAppSettings(this._repo);

  @override
  Future<Either<Failure, AppSettings>> call(void params) => _repo.load();
}
