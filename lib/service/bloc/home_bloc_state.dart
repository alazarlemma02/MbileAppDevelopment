// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {} //This state is use for triggering UI Building

abstract class HomeBlocActionState extends HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

  class HomeSuccessState extends HomeBlocState {
    final List<GroceryItem> item;
    HomeSuccessState({
      required this.item,
    });
}

class HomeErrorState extends HomeBlocState {}

class WishlistAddingState extends HomeBlocActionState {}

class WishlistAddedState extends HomeBlocActionState {}

class CartAddingState extends HomeBlocActionState {}

class CartAddedState extends HomeBlocActionState {}

class HomeNavigateToWishlistState extends HomeBlocActionState {}

class HomeNavigateToCartState extends HomeBlocActionState {}
