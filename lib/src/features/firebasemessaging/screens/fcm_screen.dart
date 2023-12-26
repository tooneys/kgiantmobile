import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/controllers/fcm_controller.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppController c = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: FutureBuilder(
        future: c.initialize(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      c.message.value?.notification?.title ?? 'title',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      c.message.value?.notification?.body ?? 'body',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'failed to initialze',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          } else {
            return Center(
              child: Text(
                'initializing...',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          }
        },
      ),
    );
  }
}
