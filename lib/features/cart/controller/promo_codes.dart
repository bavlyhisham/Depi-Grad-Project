class PromoCodeModel {
  final String code;
  final int discount;

  PromoCodeModel({required this.code, required this.discount});
}

List<PromoCodeModel> promoCodes = [
  PromoCodeModel(code: "Mrshow", discount: 10),
];
