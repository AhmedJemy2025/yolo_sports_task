import 'package:art_core/art_core.dart';
import 'package:core/core.dart';
import 'package:core/router/navigator_keys.dart';
import 'package:dio/dio.dart';
import 'package:features/features_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        FeaturesModule(),

  ];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton<DioClient>((i) =>
        DioClient(configurations: ApiConfigurations())),
    Bind.lazySingleton<Dio>((i) => i<DioClient>().dio),
    Bind.lazySingleton<NetworkHandler>((i) => NetworkHandler(i())),

  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: FeaturesModule()),
  ];
}
