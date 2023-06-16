import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:todo_app/BLOC/bloc/post_bloc.dart';
import 'package:todo_app/data/service/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final postBloc = PostBloc();
  final repo = PostRepository();
  Map<String, dynamic> toPostData = {
    "userId": 10,
    "id": 101,
    "title": "First post request",
    "body": "This is my first API post for learning api integration with BLOC."
  };

  @override
  void initState() {
    postBloc.add(PostFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(repo.getDataFromApi);
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Responses"),
        centerTitle: true,
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listenWhen: (previous, current) => current is ActionState,
        buildWhen: (previous, current) => current is! ActionState,
        bloc: postBloc,
        listener: (context, state) {
          if (state is DataPostedToApiState) {
            final snackBar = SnackBar(
              content: Text("You post was Successfull.",
                  style: TextStyle(color: Colors.green)),
              backgroundColor: Colors.grey[200],
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostLoadingState:
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            case PostLoadedState:
              final loadedState = state as PostLoadedState;
              return ListView.builder(
                  itemCount: loadedState.posts.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.92,
                            padding: const EdgeInsets.all(5.0),
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.grey[200],
                            child: Column(
                              children: [
                                Text(
                                  loadedState.posts[index].id.toString(),
                                ),
                                Text(loadedState.posts[index].title.toString()),
                                Text(loadedState.posts[index].body.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }));

            default:
              return const Center(
                child: Text("Some error ocurred!"),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(PostAddEvent(data:toPostData));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
