import 'package:fpdart/fpdart.dart';

import '../../../../core/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entities/app_settings.dart';
import '../repository/app_settings_repository.dart';

class SaveAppSettings implements UseCase<AppSettings, AppSettings> {
  final AppSettingsRepository _repo;
  const SaveAppSettings(this._repo);

  @override
  Future<Either<Failure, AppSettings>> call(AppSettings params) =>
      _repo.save(params);
}
