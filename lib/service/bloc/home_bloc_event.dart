part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class WishlistButtonClicked extends HomeBlocEvent {
  final GroceryItem item;
  WishlistButtonClicked({
    required this.item,
  });
}

class CartButtonClicked extends HomeBlocEvent {
  final GroceryItem item;
  CartButtonClicked({
    required this.item,
  });
}

class WishlistButtonNavigateClicked extends HomeBlocEvent {}

class CartButtonNavigateClicked extends HomeBlocEvent {}
