import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi/core/networks/remote/product_model.dart';

abstract class WishlistStates {}
class WishlistInitialState extends WishlistStates {}
class WishlistUpdatedState extends WishlistStates {
  final List<Product> wishlistItems;
  WishlistUpdatedState(this.wishlistItems);
}

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishlistInitialState());

  final List<Product> _wishlistItems = [];
  
  List<Product> get wishlistItems => _wishlistItems;

  bool isProductFavorite(Product product) {
    return _wishlistItems.any((item) => item.id == product.id); 
  }
  void toggleWishlist(Product product) {
    if (isProductFavorite(product)) {
      _wishlistItems.removeWhere((item) => item.id == product.id);
    } else {
      _wishlistItems.add(product);
    }
    emit(WishlistUpdatedState(List.from(_wishlistItems)));
  }
}