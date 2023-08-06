
import 'package:art_core/art_core.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  T tripleResolverCallback<T extends Object>() {
    return Modular.get<T>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.light(),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      locale: const Locale("en"),
    );
  }
}
