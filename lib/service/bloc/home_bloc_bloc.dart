import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eccomerce_app/data/provider/grocery_data.dart';
import 'package:eccomerce_app/data/repository/cart_item.dart';
import 'package:eccomerce_app/data/repository/wishlist_item.dart';
import 'package:meta/meta.dart';

import '../../data/model/grocery_item.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homePageInitialEvent);
    on<WishlistButtonNavigateClicked>((event, emit) {
      emit(HomeNavigateToWishlistState());
      print("You have navigated to the wishlist page.");
    });
    on<CartButtonNavigateClicked>(cartButtonNavigateClicked);

    on<WishlistButtonClicked>(wishlistuttonClicked);

    on<CartButtonClicked>(cartButtonClicked);
  }
  FutureOr<void> homePageInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    print("I have triggered the home initial event");
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeSuccessState(
        item: GroceryData.groceryProducts
            .map((e) => GroceryItem(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                image: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> cartButtonNavigateClicked(
      CartButtonNavigateClicked event, Emitter<HomeBlocState> emit) {
    emit(HomeNavigateToCartState());
    print("Navigate to cart event triggeredd.");
  }

  FutureOr<void> wishlistuttonClicked(
      WishlistButtonClicked event, Emitter<HomeBlocState> emit) {
    emit(WishlistAddingState());
    wishlistItem.add(event.item);
    print("Total wishlist Item: ${wishlistItem.length}");
    print("wishlist added");
    emit(WishlistAddedState());
  }

  FutureOr<void> cartButtonClicked(
      CartButtonClicked event, Emitter<HomeBlocState> emit) {
    emit(CartAddingState());
    cartItem.add(event.item);
    print("Total cart Items: ${cartItem.length}");
    print("Item added to cart");
    emit(CartAddedState());
  }
}
