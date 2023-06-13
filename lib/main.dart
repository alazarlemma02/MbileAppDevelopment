import 'package:eccomerce_app/service/bloc/home_bloc_bloc.dart';
import 'package:eccomerce_app/views/screen/cart_page.dart';
import 'package:eccomerce_app/views/screen/wishlist_page.dart';
import 'package:eccomerce_app/views/widget/item_project_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => HomeBlocBloc()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Grocery App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // initialRoute: '/',
        home: MyHomePage(title: 'My Grocer App'),
        routes: {
          '/cartPage': (context) => const CartPage(),
          '/wishlistPage': (context) => const WishlistPage()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final homeBloc = HomeBlocBloc();
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeBloc = HomeBlocBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeBlocActionState,
      buildWhen: (previous, current) => current is! HomeBlocActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistPage()));
        } else if (state is WishlistAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Item added to wishlist'),
            backgroundColor: Colors.white,
          ));
        } else if (state is CartAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Item added to cart'),
            backgroundColor: Colors.white,
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
          case HomeSuccessState:
            final successState = state as HomeSuccessState;
            return Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        BlocProvider.of<HomeBlocBloc>(context)
                            .add(WishlistButtonNavigateClicked());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_checkout_outlined),
                      onPressed: () {
                        BlocProvider.of<HomeBlocBloc>(context)
                            .add(CartButtonNavigateClicked());
                      },
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.item.length,
                    itemBuilder: ((context, index) {
                      return ItemTile(
                          groceryItem: successState.item[index],
                          homeBloc: homeBloc);
                    })));
          default:
            return Container(
              color: Colors.white,
            );
        }
      },
    );
  }
}
