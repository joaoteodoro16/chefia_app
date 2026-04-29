import 'package:bloc/bloc.dart';
import 'package:chefia_app/app/core/ui/helpers/loader.dart';
import 'package:chefia_app/app/core/ui/helpers/messager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T>
    with Loader, Messager {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
