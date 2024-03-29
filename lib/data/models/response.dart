// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/data_checker.dart';
import 'location.dart';
import 'message.dart';
import 'notification_model.dart';
import 'place_prediction.dart';
import 'route.dart';
import 'user.dart';

part 'response.g.dart';

@JsonSerializable()
class GoogleMapAPIReponse {
  @JsonKey(name: 'next_page_token', fromJson: asOrNull)
  final String? nextPageToken;
  @JsonKey(name: 'results')
  final List<GoogleMapPlace>? results;
  @JsonKey(name: 'status', fromJson: asOrNull)
  final String? status;
  @JsonKey(name: 'predictions')
  final List<PlacePrediction>? predictions;
  @JsonKey(name: 'result')
  final GoogleMapPlace? result;
  @JsonKey(name: 'candidates')
  final List<GoogleMapPlace>? places;
  @JsonKey(name: 'routes')
  final List<GoogleRoute>? routes;

  GoogleMapAPIReponse({
    this.nextPageToken,
    this.results,
    this.status,
    this.predictions,
    this.result,
    this.places,
    this.routes,
  });

  factory GoogleMapAPIReponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleMapAPIReponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleMapAPIReponseToJson(this);
}

@JsonSerializable()
class GoogleMapPlace {
  @JsonKey(name: 'business_status', fromJson: asOrNull)
  final String? businessStatus;
  @JsonKey(name: 'formatted_address', fromJson: asOrNull)
  final String? formattedAddress;
  @JsonKey(name: 'geometry')
  final Geometry? geometry;
  @JsonKey(name: 'icon', fromJson: asOrNull)
  final String? icon;
  @JsonKey(name: 'icon_background_color', fromJson: asOrNull)
  final String? iconBackgroundColor;
  @JsonKey(name: 'icon_mask_base_uri', fromJson: asOrNull)
  final String? iconMaskBaseUri;
  @JsonKey(name: 'name', fromJson: asOrNull)
  final String? name;
  @JsonKey(name: 'opening_hours')
  final OpeningHours? openingHours;
  @JsonKey(name: 'photos', fromJson: asOrNull)
  final List<Photo>? photos;
  @JsonKey(name: 'place_id', fromJson: asOrNull)
  final String? placeId;
  @JsonKey(name: 'price_level', fromJson: asOrNull)
  final int? priceLevel;
  @JsonKey(name: 'rating', fromJson: asOrNull)
  final double? rating;
  @JsonKey(name: 'reference', fromJson: asOrNull)
  final String? reference;
  @JsonKey(name: 'types', fromJson: asOrNull)
  final List<String>? types;
  @JsonKey(name: 'user_ratings_total', fromJson: asOrNull)
  final int? userRatingsTotal;

  GoogleMapPlace(
    this.businessStatus,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.priceLevel,
    this.rating,
    this.reference,
    this.types,
    this.userRatingsTotal,
  );

  factory GoogleMapPlace.fromJson(Map<String, dynamic> json) =>
      _$GoogleMapPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleMapPlaceToJson(this);
}

@JsonSerializable()
class Geometry {
  final Location location;
  final Viewport viewport;

  Geometry({
    required this.location,
    required this.viewport,
  });
  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Viewport {
  @JsonKey(name: 'northeast')
  final Location? northeast;
  @JsonKey(name: 'southwest')
  final Location? southwest;

  Viewport({
    this.northeast,
    this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) =>
      _$ViewportFromJson(json);

  Map<String, dynamic> toJson() => _$ViewportToJson(this);

  Viewport bigger(Viewport? other) {
    if (other == null) {
      // ignore: avoid_returning_this
      return this;
    }

    return (southwest!.distanceFrom(northeast)! >
            other.southwest!.distanceFrom(other.northeast)!)
        ? this
        : other;
  }
}

@JsonSerializable()
class OpeningHours {
  @JsonKey(name: 'open_now', fromJson: asOrNull)
  final bool? openNow;

  OpeningHours({this.openNow});

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);
}

@JsonSerializable()
class Photo {
  @JsonKey(name: 'height', fromJson: asOrNull)
  final int? height;
  @JsonKey(name: 'width', fromJson: asOrNull)
  final int? width;
  @JsonKey(name: 'html_attributions', fromJson: asOrNull)
  final List<String>? htmlAttributions;
  @JsonKey(name: 'photo_reference', fromJson: asOrNull)
  final String? photoReference;

  Photo({
    this.height,
    this.width,
    this.htmlAttributions,
    this.photoReference,
  });
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'user')
  final User? user;
  @JsonKey(name: 'accessToken', fromJson: asOrNull)
  final String? accessToken;
  @JsonKey(name: 'refreshToken', fromJson: asOrNull)
  final String? refreshToken;
  AuthResponse({
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class BooleanResponse {
  @JsonKey(name: 'result', fromJson: asOrNull)
  final bool? result;

  BooleanResponse({this.result});

  factory BooleanResponse.fromJson(Map<String, dynamic> json) =>
      _$BooleanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BooleanResponseToJson(this);
}

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: 'data')
  final List<Message>? data;
  @JsonKey(name: 'total', fromJson: asOrNull)
  final int? total;

  MessageResponse({
    this.data,
    this.total,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}

@JsonSerializable()
class LocationResponse {
  @JsonKey(name: 'data')
  final List<LocationHistory>? data;
  @JsonKey(name: 'total', fromJson: asOrNull)
  final int? total;
  @JsonKey(name: 'page', fromJson: asOrNull)
  final int? page;
  @JsonKey(name: 'take', fromJson: asOrNull)
  final int? take;

  LocationResponse({
    this.data,
    this.total,
    this.page,
    this.take,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}

@JsonSerializable()
class CodeResponse {
  @JsonKey(name: 'code', fromJson: asOrNull)
  final String? code;
  @JsonKey(name: 'user')
  final User? user;

  CodeResponse({
    this.code,
    this.user,
  });

  factory CodeResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CodeResponseToJson(this);
}

@JsonSerializable()
class LatestLocationResponse {
  @JsonKey(name: 'result')
  final ChildLastLocation? result;

  LatestLocationResponse({this.result});

  factory LatestLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LatestLocationResponseToJson(this);
}


@JsonSerializable()
class NotificationResponse {
  @JsonKey(name: 'data')
  final List<NotificationModel>? data;

  NotificationResponse({this.data});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
