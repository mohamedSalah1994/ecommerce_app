import 'package:flutter/material.dart';

import '../widget/auth/custom_auth_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAuthAppBar(
          titleText: 'Home',
        ),
      ),
     body: Center(child: Text('home'),)
    );
  }
}
