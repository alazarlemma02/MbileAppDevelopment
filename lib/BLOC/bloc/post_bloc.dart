import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/data/model/post_model.dart';
import 'package:todo_app/data/service/repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final repo = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<PostFetchEvent>((event, emit) async {
      emit(PostLoadingState());
      List<PostModel> posts = await repo.getDataFromApi();
      emit(PostLoadedState(posts: posts));
    });
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostState> emit) async {
    emit(DataPostingToApiState());
    var response = await repo.sendData(event.data);
    if (response == true) {
      print("You post was successfull.");
      emit(DataPostedToApiState());
    } else {
      print(false);
    }
   
  }
}
