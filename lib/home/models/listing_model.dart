class ListingModel {
  int? took;
  int? count;
  List<Data>? data;
  Facets? facets;

  ListingModel({this.took, this.count, this.data, this.facets});

  ListingModel.fromJson(Map<String, dynamic> json) {
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
  double? dScore;
  Source? sSource;

  Data({this.sIndex, this.sType, this.sId, this.dScore, this.sSource});

  Data.fromJson(Map<String, dynamic> json) {
    sIndex = json['_index'];
    sType = json['_type'];
    sId = json['_id'];
    dScore = json['_score'];
    sSource =
        json['_source'] != null ? new Source.fromJson(json['_source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_index'] = this.sIndex;
    data['_type'] = this.sType;
    data['_id'] = this.sId;
    data['_score'] = this.dScore;
    if (this.sSource != null) {
      data['_source'] = this.sSource!.toJson();
    }
    return data;
  }
}

class Source {
  bool? active;
  String? name;
  String? logo;
  String? address;
  String? phone;
  String? website;
  String? type;
  double? lat;
  double? lng;
  String? description;
  Vendor? vendor;
  List<Categories>? categories;
  Category? category;
  List<CategoryPool>? categoryPool;
  String? img;
  List<String>? images;
  List<String>? certificates;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? youtube;
  String? status;
  bool? featured;
  bool? featuredByAdmin;
  String? slug;
  bool? addressHide;
  List<String>? keywordsA;
  int? averageRating;
  int? totalReview;
  int? price;
  bool? verified;
  String? updatedAt;
  String? store;
  String? postalCode;
  String? featuresString;
  String? listingId;

  Source(
      {this.active,
      this.name,
      this.logo,
      this.address,
      this.phone,
      this.website,
      this.type,
      this.lat,
      this.lng,
      this.description,
      this.vendor,
      this.categories,
      this.category,
      this.categoryPool,
      this.img,
      this.images,
      this.certificates,
      this.facebook,
      this.twitter,
      this.linkedin,
      this.youtube,
      this.status,
      this.featured,
      this.featuredByAdmin,
      this.slug,
      this.addressHide,
      this.keywordsA,
      this.averageRating,
      this.totalReview,
      this.price,
      this.verified,
      this.updatedAt,
      this.store,
      this.postalCode,
      this.featuresString,
      this.listingId});

  Source.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    name = json['name'];
    logo = json['logo'];
    address = json['address'];
    phone = json['phone'];
    website = json['website'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    description = json['description'];
    vendor =
        json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['categoryPool'] != null) {
      categoryPool = <CategoryPool>[];
      json['categoryPool'].forEach((v) {
        categoryPool!.add(new CategoryPool.fromJson(v));
      });
    }
    img = json['img'];
    images = json['images'].cast<String>();
    certificates = json['certificates'].cast<String>();
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    youtube = json['youtube'];
    status = json['status'];
    featured = json['featured'];
    featuredByAdmin = json['featuredByAdmin'];
    slug = json['slug'];
    addressHide = json['addressHide'];
    keywordsA = json['keywordsA'].cast<String>();
    averageRating = json['averageRating'];
    totalReview = json['totalReview'];
    price = json['price'];
    verified = json['verified'];
    updatedAt = json['updatedAt'];
    store = json['store'];
    postalCode = json['postalCode'];
    featuresString = json['featuresString'];
    listingId = json['listingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['type'] = this.type;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['description'] = this.description;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.categoryPool != null) {
      data['categoryPool'] = this.categoryPool!.map((v) => v.toJson()).toList();
    }
    data['img'] = this.img;
    data['images'] = this.images;
    data['certificates'] = this.certificates;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['youtube'] = this.youtube;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['featuredByAdmin'] = this.featuredByAdmin;
    data['slug'] = this.slug;
    data['addressHide'] = this.addressHide;
    data['keywordsA'] = this.keywordsA;
    data['averageRating'] = this.averageRating;
    data['totalReview'] = this.totalReview;
    data['price'] = this.price;
    data['verified'] = this.verified;
    data['updatedAt'] = this.updatedAt;
    data['store'] = this.store;
    data['postalCode'] = this.postalCode;
    data['featuresString'] = this.featuresString;
    data['listingId'] = this.listingId;
    return data;
  }
}

class Vendor {
  String? sId;
  String? businessName;
  String? slug;

  Vendor({this.sId, this.businessName, this.slug});

  Vendor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    businessName = json['businessName'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['businessName'] = this.businessName;
    data['slug'] = this.slug;
    return data;
  }
}

class Categories {
  String? name;
  List<String>? pathA;
  String? slug;

  Categories({this.name, this.pathA, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pathA = json['pathA'].cast<String>();
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pathA'] = this.pathA;
    data['slug'] = this.slug;
    return data;
  }
}

class Category {
  String? name;
  List<PathA>? pathA;
  String? slug;

  Category({this.name, this.pathA, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['pathA'] != null) {
      pathA = <PathA>[];
      json['pathA'].forEach((v) {
        pathA!.add(new PathA.fromJson(v));
      });
    }
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.pathA != null) {
      data['pathA'] = this.pathA!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    return data;
  }
}

class PathA {
  String? sId;
  String? name;
  String? slug;
  String? id;

  PathA({this.sId, this.name, this.slug, this.id});

  PathA.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['id'] = this.id;
    return data;
  }
}

class CategoryPool {
  String? name;
  String? slug;

  CategoryPool({this.name, this.slug});

  CategoryPool.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
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
  Features? features;
  Sizes? sizes;
  Sizes? cities;
  Sizes? price;
  Sizes? discount;
  Sizes? categories;
  Sizes? countries;
  Sizes? vendors;
  Sizes? age;
  Sizes? states;

  AllAggs(
      {this.docCount,
      this.features,
      this.sizes,
      this.cities,
      this.price,
      this.discount,
      this.categories,
      this.countries,
      this.vendors,
      this.age,
      this.states});

  AllAggs.fromJson(Map<String, dynamic> json) {
    docCount = json['doc_count'];
    features = json['features'] != null
        ? new Features.fromJson(json['features'])
        : null;
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
    cities = json['cities'] != null ? new Sizes.fromJson(json['cities']) : null;
    price = json['price'] != null ? new Sizes.fromJson(json['price']) : null;
    discount =
        json['discount'] != null ? new Sizes.fromJson(json['discount']) : null;
    categories = json['categories'] != null
        ? new Sizes.fromJson(json['categories'])
        : null;
    countries = json['countries'] != null
        ? new Sizes.fromJson(json['countries'])
        : null;
    vendors =
        json['vendors'] != null ? new Sizes.fromJson(json['vendors']) : null;
    age = json['age'] != null ? new Sizes.fromJson(json['age']) : null;
    states = json['states'] != null ? new Sizes.fromJson(json['states']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_count'] = this.docCount;
    if (this.features != null) {
      data['features'] = this.features!.toJson();
    }
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.toJson();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.toJson();
    }
    if (this.vendors != null) {
      data['vendors'] = this.vendors!.toJson();
    }
    if (this.age != null) {
      data['age'] = this.age!.toJson();
    }
    if (this.states != null) {
      data['states'] = this.states!.toJson();
    }
    return data;
  }
}

class Features {
  int? docCount;
  Name? name;

  Features({this.docCount, this.name});

  Features.fromJson(Map<String, dynamic> json) {
    docCount = json['doc_count'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_count'] = this.docCount;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    return data;
  }
}

class Name {
  int? docCountErrorUpperBound;
  int? sumOtherDocCount;
  List<Buckets>? buckets;

  Name({this.docCountErrorUpperBound, this.sumOtherDocCount, this.buckets});

  Name.fromJson(Map<String, dynamic> json) {
    docCountErrorUpperBound = json['doc_count_error_upper_bound'];
    sumOtherDocCount = json['sum_other_doc_count'];
    if (json['buckets'] != null) {
      buckets = <Buckets>[];
      json['buckets'].forEach((v) {
        buckets!.add(new Buckets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_count_error_upper_bound'] = this.docCountErrorUpperBound;
    data['sum_other_doc_count'] = this.sumOtherDocCount;
    if (this.buckets != null) {
      data['buckets'] = this.buckets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizes {
  int? docCount;
  Name? all;

  Sizes({this.docCount, this.all});

  Sizes.fromJson(Map<String, dynamic> json) {
    docCount = json['doc_count'];
    all = json['all'] != null ? new Name.fromJson(json['all']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_count'] = this.docCount;
    if (this.all != null) {
      data['all'] = this.all!.toJson();
    }
    return data;
  }
}

class All {
  int? docCountErrorUpperBound;
  int? sumOtherDocCount;

  All({this.docCountErrorUpperBound, this.sumOtherDocCount});

  All.fromJson(Map<String, dynamic> json) {
    docCountErrorUpperBound = json['doc_count_error_upper_bound'];
    sumOtherDocCount = json['sum_other_doc_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doc_count_error_upper_bound'] = this.docCountErrorUpperBound;
    data['sum_other_doc_count'] = this.sumOtherDocCount;
    return data;
  }
}

class Buckets {
  String? key;
  int? to;
  int? docCount;
  int? from;

  Buckets({this.key, this.to, this.docCount, this.from});

  Buckets.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    to = json['to'];
    docCount = json['doc_count'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['to'] = this.to;
    data['doc_count'] = this.docCount;
    data['from'] = this.from;
    return data;
  }
}
