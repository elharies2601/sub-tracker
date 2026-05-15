import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../datasources/app_settings_local_data_source.dart';
import '../../domain/entities/app_settings.dart';
import '../models/app_settings_model.dart';
import '../../domain/repository/app_settings_repository.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final AppSettingsLocalDataSource _ds;
  const AppSettingsRepositoryImpl(this._ds);

  @override
  Future<Either<Failure, AppSettings>> load() => _guard(() async {
    final model = await _ds.load();
    return model.toEntity();
  });

  @override
  Future<Either<Failure, AppSettings>> save(AppSettings settings) =>
      _guard(() async {
        final model = AppSettingsModel.fromEntity(settings);
        final saved = await _ds.save(model);
        return saved.toEntity();
      });

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() fn) async {
    try {
      return Right(await fn());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
