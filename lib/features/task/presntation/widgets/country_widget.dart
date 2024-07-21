import 'package:flutter/material.dart';

import '../../data/models/country_model.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({required this.country, super.key});

  final CountryModel  country;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(country.name!));
  }
}
