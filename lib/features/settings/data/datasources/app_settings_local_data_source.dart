import 'package:isar/isar.dart';

import '../models/app_settings_model.dart';

abstract interface class AppSettingsLocalDataSource {
  Future<AppSettingsModel> load();
  Future<AppSettingsModel> save(AppSettingsModel model);
}

class AppSettingsLocalDataSourceImpl implements AppSettingsLocalDataSource {
  final Isar _isar;
  const AppSettingsLocalDataSourceImpl(this._isar);

  @override
  Future<AppSettingsModel> load() async {
    // id=1 always; return defaults on first launch
    return await _isar.appSettingsModels.get(1) ?? AppSettingsModel.defaults();
  }

  @override
  Future<AppSettingsModel> save(AppSettingsModel model) async {
    await _isar.writeTxn(() => _isar.appSettingsModels.put(model));
    return (await _isar.appSettingsModels.get(1))!;
  }
}
