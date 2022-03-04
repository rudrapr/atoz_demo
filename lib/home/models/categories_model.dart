class CategoriesModel {
  int? took;
  int? count;
  List<Data>? data;
  Facets? facets;

  CategoriesModel({this.took, this.count, this.data, this.facets});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    took = json['took'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    facets =
    json['facets'] != null ? new Facets.fromJson(json['facets']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['took'] = this.took;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.facets != null) {
      data['facets'] = this.facets!.toJson();
    }
    return data;
  }
}

class Data {
  String? sIndex;
  String? sType;
  String? sId;
  String? sScore;
  Source? sSource;
  List<int>? sort;

  Data(
      {this.sIndex,
        this.sType,
        this.sId,
        this.sScore,
        this.sSource,
        this.sort});

  Data.fromJson(Map<String, dynamic> json) {
    sIndex = json['_index'];
    sType = json['_type'];
    sId = json['_id'];
    sScore = json['_score'];
    sSource =
    json['_source'] != null ? new Source.fromJson(json['_source']) : null;
    sort = json['sort'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_index'] = this.sIndex;
    data['_type'] = this.sType;
    data['_id'] = this.sId;
    data['_score'] = this.sScore;
    if (this.sSource != null) {
      data['_source'] = this.sSource!.toJson();
    }
    data['sort'] = this.sort;
    return data;
  }
}

class Source {
  bool? active;
  String? categoryId;
  List<String>? children;
  bool? featured;
  String? icon;
  List<String>? images;
  List<String>? imagesCdn;
  List<String>? keywordsA;
  int? level;
  bool? megamenu;
  String? name;
  String? namePath;
  List<String>? namePathA;
  String? parent;
  String? path;
  List<String>? pathA;
  int? position;
  bool? shopbycategory;
  String? slug;
  String? slugPath;
  List<String>? slugPathA;
  String? store;
  String? createdAt;
  String? updatedAt;

  Source(
      {this.active,
        this.categoryId,
        this.children,
        this.featured,
        this.icon,
        this.images,
        this.imagesCdn,
        this.keywordsA,
        this.level,
        this.megamenu,
        this.name,
        this.namePath,
        this.namePathA,
        this.parent,
        this.path,
        this.pathA,
        this.position,
        this.shopbycategory,
        this.slug,
        this.slugPath,
        this.slugPathA,
        this.store,
        this.createdAt,
        this.updatedAt});

  Source.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    categoryId = json['categoryId'];
    children = json['children'].cast<String>();
    featured = json['featured'];
    icon = json['icon'];
    images = json['images'].cast<String>();
    imagesCdn = json['imagesCdn'].cast<String>();
    keywordsA = json['keywordsA'].cast<String>();
    level = json['level'];
    megamenu = json['megamenu'];
    name = json['name'];
    namePath = json['namePath'];
    namePathA = json['namePathA'].cast<String>();
    parent = json['parent'];
    path = json['path'];
    pathA = json['pathA'].cast<String>();
    position = json['position'];
    shopbycategory = json['shopbycategory'];
    slug = json['slug'];
    slugPath = json['slugPath'];
    slugPathA = json['slugPathA'].cast<String>();
    store = json['store'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['categoryId'] = this.categoryId;
    data['children'] = this.children;
    data['featured'] = this.featured;
    data['icon'] = this.icon;
    data['images'] = this.images;
    data['imagesCdn'] = this.imagesCdn;
    data['keywordsA'] = this.keywordsA;
    data['level'] = this.level;
    data['megamenu'] = this.megamenu;
    data['name'] = this.name;
    data['namePath'] = this.namePath;
    data['namePathA'] = this.namePathA;
    data['parent'] = this.parent;
    data['path'] = this.path;
    data['pathA'] = this.pathA;
    data['position'] = this.position;
    data['shopbycategory'] = this.shopbycategory;
    data['slug'] = this.slug;
    data['slugPath'] = this.slugPath;
    data['slugPathA'] = this.slugPathA;
    data['store'] = this.store;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Facets {
  AllAggs? allAggs;

  Facets({this.allAggs});

  Facets.fromJson(Map<String, dynamic> json) {
    allAggs = json['all_aggs'] != null
        ? new AllAggs.fromJson(json['all_aggs'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allAggs != null) {
      data['all_aggs'] = this.allAggs!.toJson();
    }
    return data;
  }
}

class AllAggs {
  int? docCount;

  AllAggs({this.docCount});

  AllAggs.fromJson(Map<String, dynamic> json) {
    docCount = json['doc_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_count'] = this.docCount;
    return data;
  }
}
