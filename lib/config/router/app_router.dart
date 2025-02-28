import 'package:country_app/config/router/routes.dart';
import 'package:country_app/core/widgets/error_screen.dart';
import 'package:country_app/features/countries/presentation/screens/countries_screen.dart';
import 'package:country_app/features/countries/presentation/screens/country_details_screen.dart';
import 'package:country_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:country_app/features/onboarding/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.countries:
        return MaterialPageRoute(
          builder: (_) => const CountriesScreen(),
        );
      case Routes.countryDetails:
        return MaterialPageRoute(
          builder: (_) {
            final country = routeSettings.arguments as String;
            return CountryDetailsScreen(country: country);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
