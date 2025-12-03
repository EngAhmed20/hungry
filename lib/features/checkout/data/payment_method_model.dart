import '../../../generated/assets.dart';

class PaymentMethodModel {
  final String title;
  final String? subtitle;
  final String value;
  final String icon;

  PaymentMethodModel({
    required this.title,
    this.subtitle,
    required this.value,
    required this.icon,
  });
}
List<PaymentMethodModel> paymentMethods = [
  PaymentMethodModel(
    title: "Cash on Delivery",
    value: "cash",
    icon: Assets.imagesCashicon,
  ),
  PaymentMethodModel(
    title: "Debit Card",
    subtitle: "**** **** **** 1234",
    value: "card",
    icon: Assets.imagesCreditIcon,
  ),
];
