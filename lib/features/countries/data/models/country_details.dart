import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CountryDetails {
  CountryDetails({
    required this.name,
    required this.cca2,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.flag,
    required this.maps,
    required this.population,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
  });

  final Name? name;
  final String? cca2;
  final bool? independent;
  final String? status;
  final bool? unMember;
  final Map<String, dynamic>? currencies;
  final List<String> capital;
  final String? region;
  final String? subregion;
  final Map<String, dynamic>? languages;
  final List<double> latlng;
  final bool? landlocked;
  final List<String> borders;
  final double? area;
  final String? flag;
  final Maps? maps;
  final int? population;
  final List<String> timezones;
  final List<String> continents;
  final Flags? flags;
  final CoatOfArms? coatOfArms;
  final String? startOfWeek;
  final CapitalInfo? capitalInfo;

  factory CountryDetails.fromJson(Map<String, dynamic> json) {
    return CountryDetails(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      cca2: json["cca2"],
      independent: json["independent"],
      status: json["status"],
      unMember: json["unMember"],
      currencies: json["currencies"],
      capital: json["capital"] == null
          ? []
          : List<String>.from(json["capital"]!.map((x) => x)),
      region: json["region"],
      subregion: json["subregion"],
      languages: json["languages"],
      latlng: json["latlng"] == null
          ? []
          : List<double>.from(json["latlng"]!.map((x) => x)),
      landlocked: json["landlocked"],
      borders: json["borders"] == null
          ? []
          : List<String>.from(json["borders"]!.map((x) => x)),
      area: json["area"],
      flag: json["flag"],
      maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
      population: json["population"],
      timezones: json["timezones"] == null
          ? []
          : List<String>.from(json["timezones"]!.map((x) => x)),
      continents: json["continents"] == null
          ? []
          : List<String>.from(json["continents"]!.map((x) => x)),
      flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
      coatOfArms: json["coatOfArms"] == null
          ? null
          : CoatOfArms.fromJson(json["coatOfArms"]),
      startOfWeek: json["startOfWeek"],
      capitalInfo: json["capitalInfo"] == null
          ? null
          : CapitalInfo.fromJson(json["capitalInfo"]),
    );
  }

  // Add this method to convert the model to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name?.toMap(),
      'cca2': cca2,
      'independent': independent,
      'status': status,
      'unMember': unMember,
      'currencies': currencies,
      'capital': capital,
      'region': region,
      'subregion': subregion,
      'languages': languages,
      'latlng': latlng,
      'landlocked': landlocked,
      'borders': borders,
      'area': area,
      'flag': flag,
      'maps': maps?.toMap(),
      'population': population,
      'timezones': timezones,
      'continents': continents,
      'flags': flags?.toMap(),
      'coatOfArms': coatOfArms?.toMap(),
      'startOfWeek': startOfWeek,
      'capitalInfo': capitalInfo?.toMap(),
    };
  }

  @override
  String toString() {
    return 'CountryDetails(name: $name, cca2: $cca2, independent: $independent, status: $status, unMember: $unMember, currencies: $currencies, capital: $capital, region: $region, subregion: $subregion, languages: $languages, latlng: $latlng, landlocked: $landlocked, borders: $borders, area: $area, flag: $flag, maps: $maps, population: $population, timezones: $timezones, continents: $continents, flags: $flags, coatOfArms: $coatOfArms, startOfWeek: $startOfWeek, capitalInfo: $capitalInfo)';
  }
}

class CapitalInfo {
  CapitalInfo({
    required this.latlng,
  });

  final List<double> latlng;

  factory CapitalInfo.fromJson(Map<String, dynamic> json) {
    return CapitalInfo(
      latlng: json["latlng"] == null
          ? []
          : List<double>.from(json["latlng"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latlng': latlng,
    };
  }

  String toJson() => json.encode(toMap());
}

class CoatOfArms {
  CoatOfArms({
    required this.png,
    required this.svg,
  });

  final String? png;
  final String? svg;

  factory CoatOfArms.fromJson(Map<String, dynamic> json) {
    return CoatOfArms(
      png: json["png"],
      svg: json["svg"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'png': png,
      'svg': svg,
    };
  }

  factory CoatOfArms.fromMap(Map<String, dynamic> map) {
    return CoatOfArms(
      png: map['png'] != null ? map['png'] as String : null,
      svg: map['svg'] != null ? map['svg'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}

class Ngn {
  Ngn({
    required this.name,
    required this.symbol,
  });

  final String? name;
  final String? symbol;

  factory Ngn.fromJson(Map<String, dynamic> json) {
    return Ngn(
      name: json["name"],
      symbol: json["symbol"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'symbol': symbol,
    };
  }

  factory Ngn.fromMap(Map<String, dynamic> map) {
    return Ngn(
      name: map['name'] != null ? map['name'] as String : null,
      symbol: map['symbol'] != null ? map['symbol'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}

class FraClass {
  FraClass({
    required this.f,
    required this.m,
  });

  final String? f;
  final String? m;

  factory FraClass.fromJson(Map<String, dynamic> json) {
    return FraClass(
      f: json["f"],
      m: json["m"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'f': f,
      'm': m,
    };
  }

  factory FraClass.fromMap(Map<String, dynamic> map) {
    return FraClass(
      f: map['f'] != null ? map['f'] as String : null,
      m: map['m'] != null ? map['m'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  final String? png;
  final String? svg;
  final String? alt;

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      png: json["png"],
      svg: json["svg"],
      alt: json["alt"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'png': png,
      'svg': svg,
      'alt': alt,
    };
  }

  factory Flags.fromMap(Map<String, dynamic> map) {
    return Flags(
      png: map['png'] != null ? map['png'] as String : null,
      svg: map['svg'] != null ? map['svg'] as String : null,
      alt: map['alt'] != null ? map['alt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}

class Languages {
  Languages({
    required this.eng,
  });

  final String? eng;

  factory Languages.fromJson(Map<String, dynamic> json) {
    return Languages(
      eng: json["eng"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eng': eng,
    };
  }

  factory Languages.fromMap(Map<String, dynamic> map) {
    return Languages(
      eng: map['eng'] != null ? map['eng'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}

class Maps {
  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  final String? googleMaps;
  final String? openStreetMaps;

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      googleMaps: json["googleMaps"],
      openStreetMaps: json["openStreetMaps"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'googleMaps': googleMaps,
      'openStreetMaps': openStreetMaps,
    };
  }

  factory Maps.fromMap(Map<String, dynamic> map) {
    return Maps(
      googleMaps:
          map['googleMaps'] != null ? map['googleMaps'] as String : null,
      openStreetMaps: map['openStreetMaps'] != null
          ? map['openStreetMaps'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());
}

class Name {
  Name({
    required this.common,
    required this.official,
  });

  final String? common;
  final String? official;

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json["common"],
      official: json["official"],
    );
  }

  // Add this method
  Map<String, dynamic> toMap() {
    return {
      'common': common,
      'official': official,
    };
  }
}
