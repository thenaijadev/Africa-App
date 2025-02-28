import 'package:country_app/core/constants/app_colors.dart';
import 'package:country_app/core/utils/app_constants.dart';
import 'package:country_app/core/widgets/container_widget.dart';
import 'package:country_app/core/widgets/loading_widget.dart';
import 'package:country_app/core/widgets/text_widget.dart';
import 'package:country_app/features/countries/bloc/countries_bloc.dart';
import 'package:country_app/features/countries/presentation/widgets/country_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailsScreen extends StatefulWidget {
  const CountryDetailsScreen({super.key, required this.country});
  final String country;

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  void initState() {
    context
        .read<CountryBloc>()
        .add(CountryEventGetCountryDetails(country: widget.country));
    super.initState();
  }

  @override
  void dispose() {
    context.read<CountryBloc>().add(CountryEventGetCountries());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: AppConstants.capitalize(widget.country),
          fontSize: 20,
          fontWeight: FontWeight.w600,
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
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CountryStateIsLoading) {
            return LoadingWidget(label: "Loading...");
          } else if (state is CountryStateCountryDetails) {
            return Center(
              child: ContainerWidget(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  shadow: [
                    BoxShadow(
                        color: const Color.fromARGB(84, 0, 0, 0),
                        blurRadius: 10,
                        offset: Offset(3, 3)),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.all(20),
                  color: AppColors.secondaryDark,
                  child: CountryDetailsWidget(details: state.details)),
            );
          } else if (state is CountryStateError) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CountryBloc>().add(
                    CountryEventGetCountryDetails(country: widget.country));
              },
              child: ListView(
                children: [
                  Center(
                    child: TextWidget(
                      text: "There was an error. Drag to refresh.",
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
