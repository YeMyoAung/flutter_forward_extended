import 'package:flutter/material.dart';
import 'package:generic_flutter/api_view/api_view.dart';
import 'package:generic_flutter/api_view/widget/api_view.dart';

import '../api_view/notifier/state/api_view_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApiViewGenericWidget<ApiViewBaseState, SocialMediaApiViewModel>(
        state: ApiViewBaseState(
          SocialMediaApiService(
            'https://yemyoaung.github.io/json/social-media.json',
          ),
        ),
      ),
    );
  }
}
