import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  /// PROVIDERDAKİ PROVDER CLASSI
  final T viewModel;
  final Function(T viewModel)? onInit;
  final Function(T viewModel)? onDispose;
  final Function(T viewModel)? onUpdateWidget;
  final Widget Function(BuildContext context, T viewModel) onPageView;
  const BaseView(
      {Key? key,
      required this.viewModel,
      this.onUpdateWidget,
      required this.onInit,
      required this.onDispose,
      required this.onPageView})
      : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  /// EKRAN GÜNCELLENDİĞİ ZAMAN ÇALIŞIR

  // @override
  // void didUpdateWidget(covariant BaseView<T> oldWidget) {
  //   print(
  //       "=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //   if (widget.onUpdateWidget != null) {
  //     widget.onUpdateWidget!(widget.viewModel);
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void didUpdateWidget(covariant BaseView<T> oldWidget) {
    if (widget.onUpdateWidget != null) {
      widget.onUpdateWidget!(widget.viewModel);
    } else {
      print("nullllllllllllllllllllllllllllllll");
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();

    if (widget.onInit != null) {
      widget.onInit!(widget.viewModel);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!(widget.viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageView(context, widget.viewModel);
  }
}
