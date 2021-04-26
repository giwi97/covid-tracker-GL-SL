import 'package:flutter/material.dart';

import '../screens/country_statistics.dart';
import '../screens/country_loading.dart';

import '../services/covid_service.dart';

import '../models/country_summary.dart';
import '../models/country.dart';

CovidService covidService = CovidService();

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {

  Future<List<CountryModel>> countryList;
  Future<List<CountrySummaryModel>> summaryList;

  @override
  initState() {
    super.initState();

    countryList = covidService.getCountryList();

    summaryList = covidService.getCountrySummary("sri-lanka");
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: countryList,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Center(child: Text("Error"),);
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: 
            return CountryLoading(
              inputTextLoading: true
            );
          default:
            return !snapshot.hasData 
              ? Center(child: Text("Empty"),)
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Text(
                      "Sri Lanka",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
              ),
                  SizedBox(
                    height: 8,
                  ),

                  FutureBuilder(
                    future: summaryList,
                    builder: (context, snapshot) {
                      if (snapshot.hasError)
                        return Center(child: Text("Error"),);
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting: 
                          return CountryLoading(
                            inputTextLoading: false
                          );
                        default:
                          return !snapshot.hasData 
                            ? Center(child: Text("Empty"),)
                            : CountryStatistics(
                              summaryList: snapshot.data,
                            );
                      }
                    },
                  ),
                  
                ],
              );
        }
      },
    );
    
  }
}