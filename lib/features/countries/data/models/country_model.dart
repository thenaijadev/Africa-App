class Country {
  Flags? flags;
  Name? name;
  List<String>? capital;
  Languages? languages;

  Country({this.flags, this.name, this.capital, this.languages});

  Country.fromJson(Map<String, dynamic> json) {
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    capital = json['capital'].cast<String>();
    languages = json['languages'] != null
        ? Languages.fromJson(json['languages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['capital'] = capital;
    if (languages != null) {
      data['languages'] = languages!.toJson();
    }
    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeName != null) {
      data['nativeName'] = nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Eng? eng;
  Eng? sot;

  NativeName({this.eng, this.sot});

  NativeName.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
    sot = json['sot'] != null ? Eng.fromJson(json['sot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eng != null) {
      data['eng'] = eng!.toJson();
    }
    if (sot != null) {
      data['sot'] = sot!.toJson();
    }
    return data;
  }
}

class Eng {
  String? official;
  String? common;

  Eng({this.official, this.common});

  Eng.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    data['alt'] = alt;
    return data;
  }
}

class Languages {
  String? eng;
  String? sot;

  Languages({this.eng, this.sot});

  Languages.fromJson(Map<String, dynamic> json) {
    eng = json['eng'];
    sot = json['sot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eng'] = eng;
    data['sot'] = sot;
    return data;
  }
}
