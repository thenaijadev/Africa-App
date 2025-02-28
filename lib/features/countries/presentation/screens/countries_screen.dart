import 'package:country_app/config/router/routes.dart';
import 'package:country_app/core/constants/app_colors.dart';
import 'package:country_app/core/widgets/container_widget.dart';
import 'package:country_app/core/widgets/input_field_widget.dart';
import 'package:country_app/core/widgets/loading_widget.dart';
import 'package:country_app/core/widgets/text_widget.dart';
import 'package:country_app/features/countries/bloc/countries_bloc.dart';
import 'package:country_app/features/countries/data/models/country_model.dart';
import 'package:country_app/features/countries/presentation/widgets/countries_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    context.read<CountryBloc>().add(CountryEventGetCountries());
    super.initState();
  }

  String searchString = '';
  List<Country> filteredCountries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InputFieldWidget(
            suffixIcon: Icon(
              Icons.search,
              color: AppColors.primary,
            ),
            cursorColor: AppColors.primary,
            enabledBorderRadius: 10,
            fillColor: AppColors.secondaryDark,
            hintColor: AppColors.primary,
            hintText: "Search",
            onChanged: (val) {
              setState(() {
                searchString = val!;
              });
            },
          ),
        ),
        leading: Transform.translate(
          offset: Offset(10, 0),
          child: ContainerWidget(
            onTap: () {
              Navigator.pop(context);
            },
            shadow: [
              BoxShadow(color: Colors.black, blurRadius: 3),
            ],
            borderRadius: BorderRadius.circular(5),
            margin: EdgeInsets.all(10),
            color: AppColors.secondaryDark,
            child: Icon(
              Icons.chevron_left,
              color: AppColors.primary,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<CountryBloc, CountryState>(
        listener: (context, state) {
          if (state is CountryStateCountries) {
            setState(() {
              filteredCountries = state.countries;
            });
          }
        },
        builder: (context, state) {
          if (state is CountryStateIsLoading) {
            return LoadingWidget(label: "Loading...");
          } else if (state is CountryStateCountries) {
            final countriesToDisplay = searchString.isEmpty
                ? state.countries
                : state.countries.where((country) {
                    return country.name?.common
                            ?.toLowerCase()
                            .contains(searchString.toLowerCase()) ??
                        false;
                  }).toList();

            return RefreshIndicator(
              onRefresh: () async {
                context.read<CountryBloc>().add(CountryEventGetCountries());
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    itemCount: countriesToDisplay.length,
                    itemBuilder: (context, index) {
                      return CountryItemWidget(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.countryDetails,
                              arguments:
                                  countriesToDisplay[index].name?.common);
                        },
                        flag: countriesToDisplay[index].flags?.png ?? "",
                        country: countriesToDisplay[index].name?.common ?? "",
                      );
                    }),
              ),
            );
          } else if (state is CountryStateError) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CountryBloc>().add(CountryEventGetCountries());
              },
              child: ListView(
                children: [
                  Center(
                    child: TextWidget(
                      text: "There was an error. Pull to refresh.",
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: TextWidget(
                text: "Unexpected state.",
              ),
            );
          }
        },
      ),
    );
  }
}
