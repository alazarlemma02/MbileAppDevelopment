part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostFetchEvent extends PostEvent {}

class PostAddEvent extends PostEvent {
  final Map<String, dynamic> data;
  const PostAddEvent({required this.data});
}
