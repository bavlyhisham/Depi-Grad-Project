abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {}

class CartLoadedState extends CartStates {
  final Map<String, dynamic> cartData;

  CartLoadedState(this.cartData);
}

class CartErrorState extends CartStates {
  final String error;

  CartErrorState(this.error);
}
