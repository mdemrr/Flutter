import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodexample/controller/home_page_controller.dart';
import 'package:riverpodexample/model/user_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  final String strError = "Error!";
  final String strAppbarTitle = "Typicode Riverpod Example";

  ListTile tileWidget(UserModel user) {
    return ListTile(
      title: Text(user.title ?? ""),
      leading: const Icon(Icons.person),
      subtitle: Text(user.id.toString()),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(HomePageController.instance.usersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(strAppbarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.when(
            data: (data) {
              return data
                  .map(
                    (e) => tileWidget(e),
                  )
                  .toList();
            },
            error: (error, stackTrace) {
              return [
                Text(strError),
              ];
            },
            loading: () => [
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
