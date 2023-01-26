// To parse this JSON data, do
//
//     final devices = devicesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Devices> devicesFromJson(String str) => List<Devices>.from(json.decode(str).map((x) => Devices.fromJson(x)));

String devicesToJson(List<Devices> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Devices {
    Devices({
        required this.id,
        required this.attributes,
        required this.groupId,
        required this.name,
        required this.uniqueId,
        required this.status,
        required this.lastUpdate,
        required this.positionId,
        required this.geofenceIds,
        required this.phone,
        required this.model,
        required this.contact,
        required this.category,
        required this.disabled,
        required this.expirationTime,
    });

    int id;
    Attributes attributes;
    int groupId;
    String name;
    String uniqueId;
    String status;
    dynamic lastUpdate;
    int positionId;
    dynamic geofenceIds;
    dynamic phone;
    dynamic model;
    dynamic contact;
    dynamic category;
    bool disabled;
    dynamic expirationTime;

    factory Devices.fromJson(Map<String, dynamic> json) => Devices(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
        groupId: json["groupId"],
        name: json["name"],
        uniqueId: json["uniqueId"],
        status: json["status"],
        lastUpdate: json["lastUpdate"],
        positionId: json["positionId"],
        geofenceIds: json["geofenceIds"],
        phone: json["phone"],
        model: json["model"],
        contact: json["contact"],
        category: json["category"],
        disabled: json["disabled"],
        expirationTime: json["expirationTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
        "groupId": groupId,
        "name": name,
        "uniqueId": uniqueId,
        "status": status,
        "lastUpdate": lastUpdate.toIso8601String(),
        "positionId": positionId,
        "geofenceIds": geofenceIds,
        "phone": phone,
        "model": model,
        "contact": contact,
        "category": category,
        "disabled": disabled,
        "expirationTime": expirationTime,
    };
}

class Attributes {
    Attributes();

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    );

    Map<String, dynamic> toJson() => {
    };
}
