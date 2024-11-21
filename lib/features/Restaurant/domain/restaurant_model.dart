import 'dart:convert';

class RestaurantModel {
  final List<Restaurant> restaurants;

  RestaurantModel({
    required this.restaurants,
  });

  RestaurantModel copyWith({
    List<Restaurant>? restaurants,
  }) =>
      RestaurantModel(
        restaurants: restaurants ?? this.restaurants,
      );

  factory RestaurantModel.fromRawJson(String str) =>
      RestaurantModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        restaurants: json["restaurants"] == null
            ? []
            : List<Restaurant>.from(
                json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class Restaurant {
  final Hours? hours;
  final bool? offersThirdPartyDelivery;
  final Address? address;
  final bool? supportsUpcCodes;
  final bool? isOpen;
  final String? description;
  final double? weightedRatingValue;
  final String? type;
  final bool? offersFirstPartyDelivery;
  final int? aggregatedRatingCount;
  final List<dynamic>? storePhotos;
  final List<String>? logoPhotos;
  final bool? pickupEnabled;
  final List<String>? cuisines;
  final double? miles;
  final int? dollarSigns;
  final bool? deliveryEnabled;
  final List<String>? foodPhotos;
  final String? name;
  final int? phoneNumber;
  final String? id;
  final LocalHours? localHours;

  Restaurant({
    this.hours,
    this.offersThirdPartyDelivery,
    this.address,
    this.supportsUpcCodes,
    this.isOpen,
    this.description,
    this.weightedRatingValue,
    this.type,
    this.offersFirstPartyDelivery,
    this.aggregatedRatingCount,
    this.storePhotos,
    this.logoPhotos,
    this.pickupEnabled,
    this.cuisines,
    this.miles,
    this.dollarSigns,
    this.deliveryEnabled,
    this.foodPhotos,
    this.name,
    this.phoneNumber,
    this.id,
    this.localHours,
  });

  Restaurant copyWith({
    Hours? hours,
    bool? offersThirdPartyDelivery,
    Address? address,
    bool? supportsUpcCodes,
    bool? isOpen,
    String? description,
    double? weightedRatingValue,
    String? type,
    bool? offersFirstPartyDelivery,
    int? aggregatedRatingCount,
    List<dynamic>? storePhotos,
    List<String>? logoPhotos,
    bool? pickupEnabled,
    List<String>? cuisines,
    double? miles,
    int? dollarSigns,
    bool? deliveryEnabled,
    List<String>? foodPhotos,
    String? name,
    int? phoneNumber,
    String? id,
    LocalHours? localHours,
  }) =>
      Restaurant(
        hours: hours ?? this.hours,
        offersThirdPartyDelivery:
            offersThirdPartyDelivery ?? this.offersThirdPartyDelivery,
        address: address ?? this.address,
        supportsUpcCodes: supportsUpcCodes ?? this.supportsUpcCodes,
        isOpen: isOpen ?? this.isOpen,
        description: description ?? this.description,
        weightedRatingValue: weightedRatingValue ?? this.weightedRatingValue,
        type: type ?? this.type,
        offersFirstPartyDelivery:
            offersFirstPartyDelivery ?? this.offersFirstPartyDelivery,
        aggregatedRatingCount:
            aggregatedRatingCount ?? this.aggregatedRatingCount,
        storePhotos: storePhotos ?? this.storePhotos,
        logoPhotos: logoPhotos ?? this.logoPhotos,
        pickupEnabled: pickupEnabled ?? this.pickupEnabled,
        cuisines: cuisines ?? this.cuisines,
        miles: miles ?? this.miles,
        dollarSigns: dollarSigns ?? this.dollarSigns,
        deliveryEnabled: deliveryEnabled ?? this.deliveryEnabled,
        foodPhotos: foodPhotos ?? this.foodPhotos,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        id: id ?? this.id,
        localHours: localHours ?? this.localHours,
      );

  factory Restaurant.fromRawJson(String str) =>
      Restaurant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        hours: json["hours"] == null ? null : Hours.fromJson(json["hours"]),
        offersThirdPartyDelivery: json["offers_third_party_delivery"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        supportsUpcCodes: json["supports_upc_codes"],
        isOpen: json["is_open"],
        description: json["description"],
        weightedRatingValue: json["weighted_rating_value"]?.toDouble(),
        type: json["type"],
        offersFirstPartyDelivery: json["offers_first_party_delivery"],
        aggregatedRatingCount: json["aggregated_rating_count"],
        storePhotos: json["store_photos"] == null
            ? []
            : List<dynamic>.from(json["store_photos"].map((x) => x)),
        logoPhotos: json["logo_photos"] == null
            ? []
            : List<String>.from(json["logo_photos"].map((x) => x)),
        pickupEnabled: json["pickup_enabled"],
        cuisines: json["cuisines"] == null
            ? []
            : List<String>.from(json["cuisines"].map((x) => x)),
        miles: json["miles"]?.toDouble(),
        dollarSigns: json["dollar_signs"],
        deliveryEnabled: json["delivery_enabled"],
        foodPhotos: json["food_photos"] == null
            ? []
            : List<String>.from(json["food_photos"].map((x) => x)),
        name: json["name"],
        phoneNumber: json["phone_number"],
        id: json["_id"],
        localHours: json["local_hours"] == null
            ? null
            : LocalHours.fromJson(json["local_hours"]),
      );

  Map<String, dynamic> toJson() => {
        "hours": hours?.toJson(),
        "offers_third_party_delivery": offersThirdPartyDelivery,
        "address": address?.toJson(),
        "supports_upc_codes": supportsUpcCodes,
        "is_open": isOpen,
        "description": description,
        "weighted_rating_value": weightedRatingValue,
        "type": type,
        "offers_first_party_delivery": offersFirstPartyDelivery,
        "aggregated_rating_count": aggregatedRatingCount,
        "store_photos": storePhotos == null
            ? []
            : List<dynamic>.from(storePhotos ?? [].map((x) => x)),
        "logo_photos": logoPhotos == null
            ? []
            : List<dynamic>.from(logoPhotos ?? [].map((x) => x)),
        "pickup_enabled": pickupEnabled,
        "cuisines": cuisines == null
            ? []
            : List<dynamic>.from(cuisines ?? [].map((x) => x)),
        "miles": miles,
        "dollar_signs": dollarSigns,
        "delivery_enabled": deliveryEnabled,
        "food_photos": foodPhotos == null
            ? []
            : List<dynamic>.from(foodPhotos ?? [].map((x) => x)),
        "name": name,
        "phone_number": phoneNumber,
        "_id": id,
        "local_hours": localHours?.toJson(),
      };
}

class Address {
  final String? zipcode;
  final String? country;
  final String? city;
  final double? latitude;
  final double? lon;
  final String? streetAddr2;
  final String? state;
  final String? streetAddr;
  final double? lat;
  final double? longitude;

  Address({
    this.zipcode,
    this.country,
    this.city,
    this.latitude,
    this.lon,
    this.streetAddr2,
    this.state,
    this.streetAddr,
    this.lat,
    this.longitude,
  });

  Address copyWith({
    String? zipcode,
    String? country,
    String? city,
    double? latitude,
    double? lon,
    String? streetAddr2,
    String? state,
    String? streetAddr,
    double? lat,
    double? longitude,
  }) =>
      Address(
        zipcode: zipcode ?? this.zipcode,
        country: country ?? this.country,
        city: city ?? this.city,
        latitude: latitude ?? this.latitude,
        lon: lon ?? this.lon,
        streetAddr2: streetAddr2 ?? this.streetAddr2,
        state: state ?? this.state,
        streetAddr: streetAddr ?? this.streetAddr,
        lat: lat ?? this.lat,
        longitude: longitude ?? this.longitude,
      );

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        zipcode: json["zipcode"],
        country: json["country"],
        city: json["city"],
        latitude: json["latitude"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        streetAddr2: json["street_addr_2"],
        state: json["state"],
        streetAddr: json["street_addr"],
        lat: json["lat"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "zipcode": zipcode,
        "country": country,
        "city": city,
        "latitude": latitude,
        "lon": lon,
        "street_addr_2": streetAddr2,
        "state": state,
        "street_addr": streetAddr,
        "lat": lat,
        "longitude": longitude,
      };
}

class Hours {
  final Allset? grubhub;
  final Allset? doordash;
  final Allset? allset;
  final Allset? postmates;
  final Allset? ubereats;
  final Allset? toasttakeout;

  Hours({
    this.grubhub,
    this.doordash,
    this.allset,
    this.postmates,
    this.ubereats,
    this.toasttakeout,
  });

  Hours copyWith({
    Allset? grubhub,
    Allset? doordash,
    Allset? allset,
    Allset? postmates,
    Allset? ubereats,
    Allset? toasttakeout,
  }) =>
      Hours(
        grubhub: grubhub ?? this.grubhub,
        doordash: doordash ?? this.doordash,
        allset: allset ?? this.allset,
        postmates: postmates ?? this.postmates,
        ubereats: ubereats ?? this.ubereats,
        toasttakeout: toasttakeout ?? this.toasttakeout,
      );

  factory Hours.fromRawJson(String str) => Hours.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hours.fromJson(Map<String, dynamic> json) => Hours(
        grubhub:
            json["grubhub"] == null ? null : Allset.fromJson(json["grubhub"]),
        doordash:
            json["doordash"] == null ? null : Allset.fromJson(json["doordash"]),
        allset: json["allset"] == null ? null : Allset.fromJson(json["allset"]),
        postmates: json["postmates"] == null
            ? null
            : Allset.fromJson(json["postmates"]),
        ubereats:
            json["ubereats"] == null ? null : Allset.fromJson(json["ubereats"]),
        toasttakeout: json["toasttakeout"] == null
            ? null
            : Allset.fromJson(json["toasttakeout"]),
      );

  Map<String, dynamic> toJson() => {
        "grubhub": grubhub?.toJson(),
        "doordash": doordash?.toJson(),
        "allset": allset?.toJson(),
        "postmates": postmates?.toJson(),
        "ubereats": ubereats?.toJson(),
        "toasttakeout": toasttakeout?.toJson(),
      };
}

class Allset {
  final LocalHours? localHours;
  final UtcHours? utcHours;

  Allset({
    this.localHours,
    this.utcHours,
  });

  Allset copyWith({
    LocalHours? localHours,
    UtcHours? utcHours,
  }) =>
      Allset(
        localHours: localHours ?? this.localHours,
        utcHours: utcHours ?? this.utcHours,
      );

  factory Allset.fromRawJson(String str) => Allset.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Allset.fromJson(Map<String, dynamic> json) => Allset(
        localHours: json["local_hours"] == null
            ? null
            : LocalHours.fromJson(json["local_hours"]),
        utcHours: json["utc_hours"] == null
            ? null
            : UtcHours.fromJson(json["utc_hours"]),
      );

  Map<String, dynamic> toJson() => {
        "local_hours": localHours?.toJson(),
        "utc_hours": utcHours?.toJson(),
      };
}

class LocalHours {
  final Delivery? operational;
  final Delivery? delivery;
  final Delivery? pickup;
  final Delivery? dineIn;

  LocalHours({
    this.operational,
    this.delivery,
    this.pickup,
    this.dineIn,
  });

  LocalHours copyWith({
    Delivery? operational,
    Delivery? delivery,
    Delivery? pickup,
    Delivery? dineIn,
  }) =>
      LocalHours(
        operational: operational ?? this.operational,
        delivery: delivery ?? this.delivery,
        pickup: pickup ?? this.pickup,
        dineIn: dineIn ?? this.dineIn,
      );

  factory LocalHours.fromRawJson(String str) =>
      LocalHours.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocalHours.fromJson(Map<String, dynamic> json) => LocalHours(
        operational: json["operational"] == null
            ? null
            : Delivery.fromJson(json["operational"]),
        delivery: json["delivery"] == null
            ? null
            : Delivery.fromJson(json["delivery"]),
        pickup:
            json["pickup"] == null ? null : Delivery.fromJson(json["pickup"]),
        dineIn:
            json["dine_in"] == null ? null : Delivery.fromJson(json["dine_in"]),
      );

  Map<String, dynamic> toJson() => {
        "operational": operational?.toJson(),
        "delivery": delivery?.toJson(),
        "pickup": pickup?.toJson(),
        "dine_in": dineIn?.toJson(),
      };
}

class Delivery {
  final Day? monday;
  final Day? thursday;
  final Friday? friday;
  final Sunday? sunday;
  final Day? wednesday;
  final Day? tuesday;
  final Saturday? saturday;

  Delivery({
    this.monday,
    this.thursday,
    this.friday,
    this.sunday,
    this.wednesday,
    this.tuesday,
    this.saturday,
  });

  Delivery copyWith({
    Day? monday,
    Day? thursday,
    Friday? friday,
    Sunday? sunday,
    Day? wednesday,
    Day? tuesday,
    Saturday? saturday,
  }) =>
      Delivery(
        monday: monday ?? this.monday,
        thursday: thursday ?? this.thursday,
        friday: friday ?? this.friday,
        sunday: sunday ?? this.sunday,
        wednesday: wednesday ?? this.wednesday,
        tuesday: tuesday ?? this.tuesday,
        saturday: saturday ?? this.saturday,
      );

  factory Delivery.fromRawJson(String str) =>
      Delivery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        monday: dayValues.map[json["Monday"]],
        thursday: dayValues.map[json["Thursday"]],
        friday: fridayValues.map[json["Friday"]],
        sunday: sundayValues.map[json["Sunday"]],
        wednesday: dayValues.map[json["Wednesday"]],
        tuesday: dayValues.map[json["Tuesday"]],
        saturday: saturdayValues.map[json["Saturday"]],
      );

  Map<String, dynamic> toJson() => {
        "Monday": dayValues.reverse[monday],
        "Thursday": dayValues.reverse[thursday],
        "Friday": fridayValues.reverse[friday],
        "Sunday": sundayValues.reverse[sunday],
        "Wednesday": dayValues.reverse[wednesday],
        "Tuesday": dayValues.reverse[tuesday],
        "Saturday": saturdayValues.reverse[saturday],
      };
}

enum Friday {
  CLOSED,
  THE_0700_AM_0900_PM,
  THE_0700_AM_1000_PM,
  THE_1130_AM_1000_PM,
  THE_1130_AM_1100_PM,
  THE_1145_AM_1100_PM
}

final fridayValues = EnumValues({
  "Closed": Friday.CLOSED,
  "07:00AM - 09:00PM": Friday.THE_0700_AM_0900_PM,
  "07:00AM - 10:00PM": Friday.THE_0700_AM_1000_PM,
  "11:30AM - 10:00PM": Friday.THE_1130_AM_1000_PM,
  "11:30AM - 11:00PM": Friday.THE_1130_AM_1100_PM,
  "11:45AM - 11:00PM": Friday.THE_1145_AM_1100_PM
});

enum Day {
  CLOSED,
  THE_0700_AM_0900_PM,
  THE_0700_AM_1000_PM,
  THE_1130_AM_0930_PM,
  THE_1130_AM_1030_PM,
  THE_1145_AM_1030_PM
}

final dayValues = EnumValues({
  "Closed": Day.CLOSED,
  "07:00AM - 09:00PM": Day.THE_0700_AM_0900_PM,
  "07:00AM - 10:00PM": Day.THE_0700_AM_1000_PM,
  "11:30AM - 09:30PM": Day.THE_1130_AM_0930_PM,
  "11:30AM - 10:30PM": Day.THE_1130_AM_1030_PM,
  "11:45AM - 10:30PM": Day.THE_1145_AM_1030_PM
});

enum Saturday {
  CLOSED,
  THE_0800_AM_1000_PM,
  THE_1130_AM_1000_PM,
  THE_1130_AM_1100_PM,
  THE_1200_PM_1100_PM
}

final saturdayValues = EnumValues({
  "Closed": Saturday.CLOSED,
  "08:00AM - 10:00PM": Saturday.THE_0800_AM_1000_PM,
  "11:30AM - 10:00PM": Saturday.THE_1130_AM_1000_PM,
  "11:30AM - 11:00PM": Saturday.THE_1130_AM_1100_PM,
  "12:00PM - 11:00PM": Saturday.THE_1200_PM_1100_PM
});

enum Sunday {
  CLOSED,
  THE_0800_AM_0900_PM,
  THE_1130_AM_0930_PM,
  THE_1130_AM_1000_PM,
  THE_1130_AM_1030_PM
}

final sundayValues = EnumValues({
  "Closed": Sunday.CLOSED,
  "08:00AM - 09:00PM": Sunday.THE_0800_AM_0900_PM,
  "11:30AM - 09:30PM": Sunday.THE_1130_AM_0930_PM,
  "11:30AM - 10:00PM": Sunday.THE_1130_AM_1000_PM,
  "11:30AM - 10:30PM": Sunday.THE_1130_AM_1030_PM
});

class UtcHours {
  final String? operational;
  final String? delivery;
  final String? pickup;
  final String? dineIn;
  final int? timezoneOffset;

  UtcHours({
    this.operational,
    this.delivery,
    this.pickup,
    this.dineIn,
    this.timezoneOffset,
  });

  UtcHours copyWith({
    String? operational,
    String? delivery,
    String? pickup,
    String? dineIn,
    int? timezoneOffset,
  }) =>
      UtcHours(
        operational: operational ?? this.operational,
        delivery: delivery ?? this.delivery,
        pickup: pickup ?? this.pickup,
        dineIn: dineIn ?? this.dineIn,
        timezoneOffset: timezoneOffset ?? this.timezoneOffset,
      );

  factory UtcHours.fromRawJson(String str) =>
      UtcHours.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UtcHours.fromJson(Map<String, dynamic> json) => UtcHours(
        operational: json["operational"],
        delivery: json["delivery"],
        pickup: json["pickup"],
        dineIn: json["dine_in"],
        timezoneOffset: json["timezone_offset"],
      );

  Map<String, dynamic> toJson() => {
        "operational": operational,
        "delivery": delivery,
        "pickup": pickup,
        "dine_in": dineIn,
        "timezone_offset": timezoneOffset,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
