import 'package:country_app/config/router/app_router.dart';
import 'package:country_app/config/router/routes.dart';
import 'package:country_app/core/constants/app_colors.dart';
import 'package:country_app/core/utils/app_constraints.dart';
import 'package:country_app/features/countries/bloc/countries_bloc.dart';
import 'package:country_app/features/countries/data/providers/countries_provider.dart';
import 'package:country_app/features/countries/data/repositories/countries_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    AppConstraints().initialize(context);

    final appRouter = AppRouter();
    return BlocProvider(
      create: (context) => CountryBloc(
          repository: CountryRepository(countriesProvider: CountryProvider())),
      child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                theme: ThemeData(
                    primaryColor: AppColors.primary,
                    appBarTheme: AppBarTheme(color: AppColors.secondaryDark)),
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                initialRoute: Routes.splash,
                onGenerateRoute: appRouter.onGenerateRoute,
              );
            },
          )),
    );
  }
}
