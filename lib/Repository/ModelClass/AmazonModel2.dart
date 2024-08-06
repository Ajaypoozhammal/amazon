class AmazonModel2 {
  AmazonModel2({
      this.status, 
      this.requestId, 
      this.parameters, 
      this.data,});

  AmazonModel2.fromJson(dynamic json) {
    status = json['status'];
    requestId = json['request_id'];
    parameters = json['parameters'] != null ? Parameters.fromJson(json['parameters']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? requestId;
  Parameters? parameters;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['request_id'] = requestId;
    if (parameters != null) {
      map['parameters'] = parameters?.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.asin, 
      this.productTitle, 
      this.productPrice, 
      this.productOriginalPrice, 
      this.currency, 
      this.country, 
      this.productStarRating, 
      this.productNumRatings, 
      this.productUrl, 
      this.productPhoto, 
      this.productNumOffers, 
      this.productAvailability, 
      this.isBestSeller, 
      this.isAmazonChoice, 
      this.isPrime, 
      this.climatePledgeFriendly, 
      this.salesVolume, 
      this.aboutProduct, 
      this.productDescription, 
      this.productInformation, 
      this.productPhotos, 
      this.productDetails, 
      this.customersSay, 
      this.delivery, 
      this.categoryPath, 
      this.productVariations,});

  Data.fromJson(dynamic json) {
    asin = json['asin'];
    productTitle = json['product_title'];
    productPrice = json['product_price'];
    productOriginalPrice = json['product_original_price'];
    currency = json['currency'];
    country = json['country'];
    productStarRating = json['product_star_rating'];
    productNumRatings = json['product_num_ratings'];
    productUrl = json['product_url'];
    productPhoto = json['product_photo'];
    productNumOffers = json['product_num_offers'];
    productAvailability = json['product_availability'];
    isBestSeller = json['is_best_seller'];
    isAmazonChoice = json['is_amazon_choice'];
    isPrime = json['is_prime'];
    climatePledgeFriendly = json['climate_pledge_friendly'];
    salesVolume = json['sales_volume'];
    aboutProduct = json['about_product'] != null ? json['about_product'].cast<String>() : [];
    productDescription = json['product_description'];
    productInformation = json['product_information'] != null ? ProductInformation.fromJson(json['product_information']) : null;
    productPhotos = json['product_photos'] != null ? json['product_photos'].cast<String>() : [];
    productDetails = json['product_details'] != null ? ProductDetails.fromJson(json['product_details']) : null;
    customersSay = json['customers_say'];
    delivery = json['delivery'];
    if (json['category_path'] != null) {
      categoryPath = [];
      json['category_path'].forEach((v) {
        categoryPath?.add(CategoryPath.fromJson(v));
      });
    }
    productVariations = json['product_variations'] != null ? ProductVariations.fromJson(json['product_variations']) : null;
  }
  String? asin;
  String? productTitle;
  String? productPrice;
  String? productOriginalPrice;
  String? currency;
  String? country;
  String? productStarRating;
  int? productNumRatings;
  String? productUrl;
  String? productPhoto;
  int? productNumOffers;
  String? productAvailability;
  bool? isBestSeller;
  bool? isAmazonChoice;
  bool? isPrime;
  bool? climatePledgeFriendly;
  String? salesVolume;
  List<String>? aboutProduct;
  String? productDescription;
  ProductInformation? productInformation;
  List<String>? productPhotos;
  ProductDetails? productDetails;
  String? customersSay;
  String? delivery;
  List<CategoryPath>? categoryPath;
  ProductVariations? productVariations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['asin'] = asin;
    map['product_title'] = productTitle;
    map['product_price'] = productPrice;
    map['product_original_price'] = productOriginalPrice;
    map['currency'] = currency;
    map['country'] = country;
    map['product_star_rating'] = productStarRating;
    map['product_num_ratings'] = productNumRatings;
    map['product_url'] = productUrl;
    map['product_photo'] = productPhoto;
    map['product_num_offers'] = productNumOffers;
    map['product_availability'] = productAvailability;
    map['is_best_seller'] = isBestSeller;
    map['is_amazon_choice'] = isAmazonChoice;
    map['is_prime'] = isPrime;
    map['climate_pledge_friendly'] = climatePledgeFriendly;
    map['sales_volume'] = salesVolume;
    map['about_product'] = aboutProduct;
    map['product_description'] = productDescription;
    if (productInformation != null) {
      map['product_information'] = productInformation?.toJson();
    }
    map['product_photos'] = productPhotos;
    if (productDetails != null) {
      map['product_details'] = productDetails?.toJson();
    }
    map['customers_say'] = customersSay;
    map['delivery'] = delivery;
    if (categoryPath != null) {
      map['category_path'] = categoryPath?.map((v) => v.toJson()).toList();
    }
    if (productVariations != null) {
      map['product_variations'] = productVariations?.toJson();
    }
    return map;
  }

}

class ProductVariations {
  ProductVariations({
      this.color,});

  ProductVariations.fromJson(dynamic json) {
    if (json['color'] != null) {
      color = [];
      json['color'].forEach((v) {
        color?.add(Color1.fromJson(v));
      });
    }
  }
  List<Color1>? color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (color != null) {
      map['color'] = color?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Color1 {
  Color1({
      this.asin, 
      this.value, 
      this.photo, 
      this.isAvailable,});

  Color1.fromJson(dynamic json) {
    asin = json['asin'];
    value = json['value'];
    photo = json['photo'];
    isAvailable = json['is_available'];
  }
  String? asin;
  String? value;
  String? photo;
  bool? isAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['asin'] = asin;
    map['value'] = value;
    map['photo'] = photo;
    map['is_available'] = isAvailable;
    return map;
  }

}

class CategoryPath {
  CategoryPath({
      this.id, 
      this.name, 
      this.link,});

  CategoryPath.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
  }
  String? id;
  String? name;
  String? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['link'] = link;
    return map;
  }

}

class ProductDetails {
  ProductDetails({
      this.brand, 
      this.operatingSystem, 
      this.ramMemoryInstalledSize, 
      this.cPUSpeed, 
      this.memoryStorageCapacity, 
      this.screenSize, 
      this.resolution, 
      this.refreshRate, 
      this.modelName, 
      this.wirelessCarrier,});

  ProductDetails.fromJson(dynamic json) {
    brand = json['Brand'];
    operatingSystem = json['Operating System'];
    ramMemoryInstalledSize = json['Ram Memory Installed Size'];
    cPUSpeed = json['CPU Speed'];
    memoryStorageCapacity = json['Memory Storage Capacity'];
    screenSize = json['Screen Size'];
    resolution = json['Resolution'];
    refreshRate = json['Refresh Rate'];
    modelName = json['Model Name'];
    wirelessCarrier = json['Wireless Carrier'];
  }
  String? brand;
  String? operatingSystem;
  String? ramMemoryInstalledSize;
  String? cPUSpeed;
  String? memoryStorageCapacity;
  String? screenSize;
  String? resolution;
  String? refreshRate;
  String? modelName;
  String? wirelessCarrier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Brand'] = brand;
    map['Operating System'] = operatingSystem;
    map['Ram Memory Installed Size'] = ramMemoryInstalledSize;
    map['CPU Speed'] = cPUSpeed;
    map['Memory Storage Capacity'] = memoryStorageCapacity;
    map['Screen Size'] = screenSize;
    map['Resolution'] = resolution;
    map['Refresh Rate'] = refreshRate;
    map['Model Name'] = modelName;
    map['Wireless Carrier'] = wirelessCarrier;
    return map;
  }

}

class ProductInformation {
  ProductInformation({
      this.productDimensions, 
      this.itemWeight, 
      this.asin, 
      this.itemmodelnumber, 
      this.batteries, 
      this.os, 
      this.ram, 
      this.wirelesscommunicationtechnologies, 
      this.connectivitytechnologies, 
      this.gps, 
      this.specialfeatures, 
      this.otherdisplayfeatures, 
      this.humanInterfaceInput, 
      this.scannerResolution, 
      this.othercamerafeatures, 
      this.audioJack, 
      this.formFactor, 
      this.color, 
      this.batteryPowerRating, 
      this.whatsinthebox, 
      this.manufacturer, 
      this.countryofOrigin, 
      this.dateFirstAvailable, 
      this.memoryStorageCapacity, 
      this.standingscreendisplaysize, 
      this.ramMemoryInstalledSize, 
      this.batteryCapacity, 
      this.weight, 
      this.chargingTime,});

  ProductInformation.fromJson(dynamic json) {
    productDimensions = json['Product Dimensions'];
    itemWeight = json['Item Weight'];
    asin = json['ASIN'];
    itemmodelnumber = json['Item model number'];
    batteries = json['Batteries'];
    os = json['OS'];
    ram = json['RAM'];
    wirelesscommunicationtechnologies = json['Wireless communication technologies'];
    connectivitytechnologies = json['Connectivity technologies'];
    gps = json['GPS'];
    specialfeatures = json['Special features'];
    otherdisplayfeatures = json['Other display features'];
    humanInterfaceInput = json['Human Interface Input'];
    scannerResolution = json['Scanner Resolution'];
    othercamerafeatures = json['Other camera features'];
    audioJack = json['Audio Jack'];
    formFactor = json['Form Factor'];
    color = json['Color'];
    batteryPowerRating = json['Battery Power Rating'];
    whatsinthebox = json['Whats in the box'];
    manufacturer = json['Manufacturer'];
    countryofOrigin = json['Country of Origin'];
    dateFirstAvailable = json['Date First Available'];
    memoryStorageCapacity = json['Memory Storage Capacity'];
    standingscreendisplaysize = json['Standing screen display size'];
    ramMemoryInstalledSize = json['Ram Memory Installed Size'];
    batteryCapacity = json['Battery Capacity'];
    weight = json['Weight'];
    chargingTime = json['Charging Time'];
  }
  String? productDimensions;
  String? itemWeight;
  String? asin;
  String? itemmodelnumber;
  String? batteries;
  String? os;
  String? ram;
  String? wirelesscommunicationtechnologies;
  String? connectivitytechnologies;
  String? gps;
  String? specialfeatures;
  String? otherdisplayfeatures;
  String? humanInterfaceInput;
  String? scannerResolution;
  String? othercamerafeatures;
  String? audioJack;
  String? formFactor;
  String? color;
  String? batteryPowerRating;
  String? whatsinthebox;
  String? manufacturer;
  String? countryofOrigin;
  String? dateFirstAvailable;
  String? memoryStorageCapacity;
  String? standingscreendisplaysize;
  String? ramMemoryInstalledSize;
  String? batteryCapacity;
  String? weight;
  String? chargingTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Product Dimensions'] = productDimensions;
    map['Item Weight'] = itemWeight;
    map['ASIN'] = asin;
    map['Item model number'] = itemmodelnumber;
    map['Batteries'] = batteries;
    map['OS'] = os;
    map['RAM'] = ram;
    map['Wireless communication technologies'] = wirelesscommunicationtechnologies;
    map['Connectivity technologies'] = connectivitytechnologies;
    map['GPS'] = gps;
    map['Special features'] = specialfeatures;
    map['Other display features'] = otherdisplayfeatures;
    map['Human Interface Input'] = humanInterfaceInput;
    map['Scanner Resolution'] = scannerResolution;
    map['Other camera features'] = othercamerafeatures;
    map['Audio Jack'] = audioJack;
    map['Form Factor'] = formFactor;
    map['Color'] = color;
    map['Battery Power Rating'] = batteryPowerRating;
    map['Whats in the box'] = whatsinthebox;
    map['Manufacturer'] = manufacturer;
    map['Country of Origin'] = countryofOrigin;
    map['Date First Available'] = dateFirstAvailable;
    map['Memory Storage Capacity'] = memoryStorageCapacity;
    map['Standing screen display size'] = standingscreendisplaysize;
    map['Ram Memory Installed Size'] = ramMemoryInstalledSize;
    map['Battery Capacity'] = batteryCapacity;
    map['Weight'] = weight;
    map['Charging Time'] = chargingTime;
    return map;
  }

}

class Parameters {
  Parameters({
      this.asin, 
      this.country,});

  Parameters.fromJson(dynamic json) {
    asin = json['asin'];
    country = json['country'];
  }
  String? asin;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['asin'] = asin;
    map['country'] = country;
    return map;
  }

}