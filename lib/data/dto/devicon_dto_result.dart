class DeviconDtoResult {
  DeviconDtoResult({
    this.name,
    this.tags,
    this.versions,
    this.color,
    this.aliases,
  });

  DeviconDtoResult.fromJson(dynamic json) {
    name = json['name'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    versions =
        json['versions'] != null ? Versions.fromJson(json['versions']) : null;
    color = json['color'];
    if (json['aliases'] != null) {
      aliases = [];
      json['aliases'].forEach((v) {
        aliases?.add(Aliases.fromJson(v));
      });
    }
  }
  String? name;
  List<String>? tags;
  Versions? versions;
  String? color;
  List<Aliases>? aliases;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['tags'] = tags;
    if (versions != null) {
      map['versions'] = versions?.toJson();
    }
    map['color'] = color;
    if (aliases != null) {
      map['aliases'] = aliases?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Aliases {
  Aliases({
    this.base,
    this.alias,
  });

  Aliases.fromJson(dynamic json) {
    base = json['base'];
    alias = json['alias'];
  }
  String? base;
  String? alias;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['base'] = base;
    map['alias'] = alias;
    return map;
  }
}

class Versions {
  Versions({
    this.svg,
    this.font,
  });

  Versions.fromJson(dynamic json) {
    svg = json['svg'] != null ? json['svg'].cast<String>() : [];
    font = json['font'] != null ? json['font'].cast<String>() : [];
  }
  List<String>? svg;
  List<String>? font;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['svg'] = svg;
    map['font'] = font;
    return map;
  }
}
