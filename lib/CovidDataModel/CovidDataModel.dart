class CovidDataModel {
  final TotalCaseList totalList;
  final List<CountryList> countryList;
  final String date;


  CovidDataModel({
    this.totalList,
    this.countryList,
    this.date
  });

  factory CovidDataModel.fromJson(Map<String, dynamic> parsedJson) {
    var tagObjsJson = parsedJson['Countries'] as List;
    List<CountryList> _tags = tagObjsJson.map((tagJson) => CountryList.fromJson(tagJson)).toList();
    return CovidDataModel(
    totalList: TotalCaseList.fromJson(parsedJson['Global']),
    countryList:_tags,
    date: parsedJson['Date'] as String);
  }
}

class TotalCaseList {
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;


  TotalCaseList({this.newConfirmed, this.totalConfirmed, this.newDeaths, this.totalDeaths, this.newRecovered, this.totalRecovered});

  factory TotalCaseList.fromJson(Map<String, dynamic> parsedJson){
    return TotalCaseList(
        newConfirmed:parsedJson['NewConfirmed'],
        totalConfirmed:parsedJson["TotalConfirmed"],
        newDeaths:parsedJson["NewDeaths"],
        totalDeaths:parsedJson["TotalDeaths"],
        newRecovered:parsedJson["NewRecovered"],
        totalRecovered:parsedJson["TotalRecovered"],
    );
  }

}


class CountryList {
  final String country;
  final String countryCode;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final String date;

  CountryList({this.country, this.countryCode, this.newConfirmed, this.totalConfirmed, this.newDeaths, this.totalDeaths, this.newRecovered, this.totalRecovered, this.date});

  factory CountryList.fromJson(Map<String, dynamic> parsedJson){
    return CountryList(
        country:parsedJson['Country'],
        countryCode:parsedJson['CountryCode'],
        newConfirmed:parsedJson['NewConfirmed'],
        totalConfirmed:parsedJson["TotalConfirmed"],
        newDeaths:parsedJson["NewDeaths"],
        totalDeaths:parsedJson["TotalDeaths"],
        newRecovered:parsedJson["NewRecovered"],
        totalRecovered:parsedJson["TotalRecovered"],
        date:parsedJson["Date"] as String
    );
  }

}
