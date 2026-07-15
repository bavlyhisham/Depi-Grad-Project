class PromoCodeModel {
  final String code;
  final int discount;

  PromoCodeModel({required this.code, required this.discount});
}

List<PromoCodeModel> promoCodes = [
  PromoCodeModel(code: "SAVE10", discount: 10),

  PromoCodeModel(code: "WELCOME15", discount: 15),

  PromoCodeModel(code: "depi", discount: 20),

  PromoCodeModel(code: "SUMMER25", discount: 25),

  PromoCodeModel(code: "VIP30", discount: 30),
];
