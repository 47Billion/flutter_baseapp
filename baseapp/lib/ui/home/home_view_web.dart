

import 'package:flutter/material.dart';
import 'package:getx_mvvm_arc/ui/home/home_view_model.dart';

class HomeViewWeb extends StatelessWidget {
  final HomeViewModel homeVM;

  HomeViewWeb(this.homeVM);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${homeVM.hello}',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
