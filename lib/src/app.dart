import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_task/features/task/presntation/bloc/fetch_list/fetch_list_bloc.dart';

import 'package:graphql_task/core/presentation/routes/app_router.dart'
    as router;

import '../injection.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = router.AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => getIt<FetchListBloc>(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, c) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
              return MaterialApp.router(
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
              );
            }));
  }
}
