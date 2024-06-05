// import 'package:json_annotation/json_annotation.dart';

// part 'payment_respoonse.g.dart';

// @JsonSerializable()
// class PaymentResponse {
//   String? status;
//   @JsonKey(name: "session")
//   Session? session;
//   PaymentResponse({this.status, this.session});

//   factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
//       _$PaymentResponseFromJson(json);
// }

// @JsonSerializable()
// class Session {
//   String? id;
//   String? object;
//   String? afterExpiration;
//   @JsonKey(name: "allow_promotion_codes")
//   String? allowPromotionCodes;
//   @JsonKey(name: "amount_subtotal")
//   int? amountSubtotal;
//   @JsonKey(name: "automatic_tax")
//   	AutomaticTax? automaticTax;
//   @JsonKey(name: "billing_address_collection")
//   String? billingAddressCollection;
//   @JsonKey(name: "cancel_url")
//   String? cancelUrl;
//   @JsonKey(name: "client_reference_id")
//   String? clientReferenceId;
//   @JsonKey(name: "client_secret")
//   String? clientSecret;
//   String? consent;

// }
// class AutomaticTax {
//   bool? enabled;
// 	String? liability;
// 	String? status;
// }