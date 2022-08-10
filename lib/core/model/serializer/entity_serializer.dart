import 'package:flutter_template/core/common/store/store_extensions.dart';

abstract class EntitySerializer<CommonModel, ServiceModel, DatabaseModel> {
  CommonModel serviceToCommonModel(ServiceModel serviceModel);

  CommonModel databaseToCommonModel(DatabaseModel databaseModel);

  ServiceModel commonToServiceModel(CommonModel commonModel);

  DatabaseModel commonToDatabaseModel(CommonModel commonModel);
}

abstract class SimpleEntitySerializer<CommonModel, DatabaseModel>
    extends EntitySerializer<CommonModel, CommonModel, DatabaseModel>
    implements StoreConverter<DatabaseModel, CommonModel> {
  @override
  CommonModel serviceToCommonModel(CommonModel serviceModel) => serviceModel;

  @override
  CommonModel commonToServiceModel(CommonModel commonModel) => commonModel;

  @override
  CommonModel fromT0(DatabaseModel t0) => databaseToCommonModel(t0);

  @override
  DatabaseModel fromT1(CommonModel t1) => commonToDatabaseModel(t1);
}
