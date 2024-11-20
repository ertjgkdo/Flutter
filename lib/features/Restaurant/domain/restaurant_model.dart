import 'dart:convert';

class RestaurantModel {
    List<Restaurant> restaurants;

    RestaurantModel({
        required this.restaurants,
    });

    RestaurantModel copyWith({
        List<Restaurant>? restaurants,
    }) => 
        RestaurantModel(
            restaurants: restaurants ?? this.restaurants,
        );

    factory RestaurantModel.fromRawJson(String str) => RestaurantModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
    };
}

class Restaurant {
    Hours hours;
    bool offersThirdPartyDelivery;
    Address address;
    bool supportsUpcCodes;
    bool isOpen;
    String description;
    double weightedRatingValue;
    String type;
    bool offersFirstPartyDelivery;
    int aggregatedRatingCount;
    List<dynamic> storePhotos;
    List<String> logoPhotos;
    bool pickupEnabled;
    List<String> cuisines;
    double miles;
    int dollarSigns;
    bool deliveryEnabled;
    List<String> foodPhotos;
    String name;
    int phoneNumber;
    String id;
    LocalHours localHours;

    Restaurant({
        required this.hours,
        required this.offersThirdPartyDelivery,
        required this.address,
        required this.supportsUpcCodes,
        required this.isOpen,
        required this.description,
        required this.weightedRatingValue,
        required this.type,
        required this.offersFirstPartyDelivery,
        required this.aggregatedRatingCount,
        required this.storePhotos,
        required this.logoPhotos,
        required this.pickupEnabled,
        required this.cuisines,
        required this.miles,
        required this.dollarSigns,
        required this.deliveryEnabled,
        required this.foodPhotos,
        required this.name,
        required this.phoneNumber,
        required this.id,
        required this.localHours,
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
            offersThirdPartyDelivery: offersThirdPartyDelivery ?? this.offersThirdPartyDelivery,
            address: address ?? this.address,
            supportsUpcCodes: supportsUpcCodes ?? this.supportsUpcCodes,
            isOpen: isOpen ?? this.isOpen,
            description: description ?? this.description,
            weightedRatingValue: weightedRatingValue ?? this.weightedRatingValue,
            type: type ?? this.type,
            offersFirstPartyDelivery: offersFirstPartyDelivery ?? this.offersFirstPartyDelivery,
            aggregatedRatingCount: aggregatedRatingCount ?? this.aggregatedRatingCount,
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

    factory Restaurant.fromRawJson(String str) => Restaurant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        hours: Hours.fromJson(json["hours"]),
        offersThirdPartyDelivery: json["offers_third_party_delivery"],
        address: Address.fromJson(json["address"]),
        supportsUpcCodes: json["supports_upc_codes"],
        isOpen: json["is_open"],
        description: json["description"],
        weightedRatingValue: json["weighted_rating_value"]?.toDouble(),
        type: json["type"],
        offersFirstPartyDelivery: json["offers_first_party_delivery"],
        aggregatedRatingCount: json["aggregated_rating_count"],
        storePhotos: List<dynamic>.from(json["store_photos"].map((x) => x)),
        logoPhotos: List<String>.from(json["logo_photos"].map((x) => x)),
        pickupEnabled: json["pickup_enabled"],
        cuisines: List<String>.from(json["cuisines"].map((x) => x)),
        miles: json["miles"]?.toDouble(),
        dollarSigns: json["dollar_signs"],
        deliveryEnabled: json["delivery_enabled"],
        foodPhotos: List<String>.from(json["food_photos"].map((x) => x)),
        name: json["name"],
        phoneNumber: json["phone_number"],
        id: json["_id"],
        localHours: LocalHours.fromJson(json["local_hours"]),
    );

    Map<String, dynamic> toJson() => {
        "hours": hours.toJson(),
        "offers_third_party_delivery": offersThirdPartyDelivery,
        "address": address.toJson(),
        "supports_upc_codes": supportsUpcCodes,
        "is_open": isOpen,
        "description": description,
        "weighted_rating_value": weightedRatingValue,
        "type": type,
        "offers_first_party_delivery": offersFirstPartyDelivery,
        "aggregated_rating_count": aggregatedRatingCount,
        "store_photos": List<dynamic>.from(storePhotos.map((x) => x)),
        "logo_photos": List<dynamic>.from(logoPhotos.map((x) => x)),
        "pickup_enabled": pickupEnabled,
        "cuisines": List<dynamic>.from(cuisines.map((x) => x)),
        "miles": miles,
        "dollar_signs": dollarSigns,
        "delivery_enabled": deliveryEnabled,
        "food_photos": List<dynamic>.from(foodPhotos.map((x) => x)),
        "name": name,
        "phone_number": phoneNumber,
        "_id": id,
        "local_hours": localHours.toJson(),
    };
}

class Address {
    String zipcode;
    String country;
    String city;
    double latitude;
    double lon;
    String streetAddr2;
    String state;
    String streetAddr;
    double lat;
    double longitude;

    Address({
        required this.zipcode,
        required this.country,
        required this.city,
        required this.latitude,
        required this.lon,
        required this.streetAddr2,
        required this.state,
        required this.streetAddr,
        required this.lat,
        required this.longitude,
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
    Doordash grubhub;
    Doordash doordash;
    Doordash? allset;
    Doordash? postmates;
    Doordash? ubereats;
    Doordash? toasttakeout;

    Hours({
        required this.grubhub,
        required this.doordash,
        this.allset,
        this.postmates,
        this.ubereats,
        this.toasttakeout,
    });

    Hours copyWith({
        Doordash? grubhub,
        Doordash? doordash,
        Doordash? allset,
        Doordash? postmates,
        Doordash? ubereats,
        Doordash? toasttakeout,
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
        grubhub: Doordash.fromJson(json["grubhub"]),
        doordash: Doordash.fromJson(json["doordash"]),
        allset: json["allset"] == null ? null : Doordash.fromJson(json["allset"]),
        postmates: json["postmates"] == null ? null : Doordash.fromJson(json["postmates"]),
        ubereats: json["ubereats"] == null ? null : Doordash.fromJson(json["ubereats"]),
        toasttakeout: json["toasttakeout"] == null ? null : Doordash.fromJson(json["toasttakeout"]),
    );

    Map<String, dynamic> toJson() => {
        "grubhub": grubhub.toJson(),
        "doordash": doordash.toJson(),
        "allset": allset?.toJson(),
        "postmates": postmates?.toJson(),
        "ubereats": ubereats?.toJson(),
        "toasttakeout": toasttakeout?.toJson(),
    };
}

class Doordash {
    LocalHours localHours;
    UtcHours utcHours;

    Doordash({
        required this.localHours,
        required this.utcHours,
    });

    Doordash copyWith({
        LocalHours? localHours,
        UtcHours? utcHours,
    }) => 
        Doordash(
            localHours: localHours ?? this.localHours,
            utcHours: utcHours ?? this.utcHours,
        );

    factory Doordash.fromRawJson(String str) => Doordash.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Doordash.fromJson(Map<String, dynamic> json) => Doordash(
        localHours: LocalHours.fromJson(json["local_hours"]),
        utcHours: UtcHours.fromJson(json["utc_hours"]),
    );

    Map<String, dynamic> toJson() => {
        "local_hours": localHours.toJson(),
        "utc_hours": utcHours.toJson(),
    };
}

class LocalHours {
    Delivery operational;
    Delivery delivery;
    Delivery pickup;
    Delivery dineIn;

    LocalHours({
        required this.operational,
        required this.delivery,
        required this.pickup,
        required this.dineIn,
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

    factory LocalHours.fromRawJson(String str) => LocalHours.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LocalHours.fromJson(Map<String, dynamic> json) => LocalHours(
        operational: Delivery.fromJson(json["operational"]),
        delivery: Delivery.fromJson(json["delivery"]),
        pickup: Delivery.fromJson(json["pickup"]),
        dineIn: Delivery.fromJson(json["dine_in"]),
    );

    Map<String, dynamic> toJson() => {
        "operational": operational.toJson(),
        "delivery": delivery.toJson(),
        "pickup": pickup.toJson(),
        "dine_in": dineIn.toJson(),
    };
}

class Delivery {
    Day monday;
    Day thursday;
    Friday friday;
    Sunday sunday;
    Day wednesday;
    Day tuesday;
    Saturday saturday;

    Delivery({
        required this.monday,
        required this.thursday,
        required this.friday,
        required this.sunday,
        required this.wednesday,
        required this.tuesday,
        required this.saturday,
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

    factory Delivery.fromRawJson(String str) => Delivery.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        monday: dayValues.map[json["Monday"]]!,
        thursday: dayValues.map[json["Thursday"]]!,
        friday: fridayValues.map[json["Friday"]]!,
        sunday: sundayValues.map[json["Sunday"]]!,
        wednesday: dayValues.map[json["Wednesday"]]!,
        tuesday: dayValues.map[json["Tuesday"]]!,
        saturday: saturdayValues.map[json["Saturday"]]!,
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
    String operational;
    String delivery;
    String pickup;
    String dineIn;
    int timezoneOffset;

    UtcHours({
        required this.operational,
        required this.delivery,
        required this.pickup,
        required this.dineIn,
        required this.timezoneOffset,
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

    factory UtcHours.fromRawJson(String str) => UtcHours.fromJson(json.decode(str));

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
