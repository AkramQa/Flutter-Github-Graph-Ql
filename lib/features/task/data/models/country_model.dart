import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_model.freezed.dart';
part 'country_model.g.dart';
@freezed
class CountryModel with _$CountryModel{
  factory CountryModel({
     String? name,
     String? native,
     String? capital,
     String? emoji,
     String? currency
}) =_CountryModel;
  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

}