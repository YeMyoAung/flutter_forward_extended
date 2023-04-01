import 'package:flutter/material.dart';
import 'package:generic_flutter/api_view/api_view.dart';
import 'package:generic_flutter/api_view/notifier/state/api_view_state.dart';

class ApiViewGenericWidget<T extends ApiViewBaseState,
    M extends ApiViewBaseModel> extends StatefulWidget {
  final T state;
  final Widget Function(bool loading)? loadingBuilder;
  final Widget Function(String? error)? errorBuilder;
  final Widget Function(List<M> error)? valueBuilder;
  const ApiViewGenericWidget({
    super.key,
    required this.state,
    this.errorBuilder,
    this.loadingBuilder,
    this.valueBuilder,
  });

  @override
  State<ApiViewGenericWidget> createState() => _ApiViewGenericWidgetState();
}

class _ApiViewGenericWidgetState extends State<ApiViewGenericWidget> {
  @override
  void initState() {
    super.initState();
    widget.state.next();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return ValueListenableBuilder(
      valueListenable: widget.state.loadingNotifier,
      builder: (context, loading, child) {
        if (widget.loadingBuilder != null) {
          return widget.loadingBuilder!.call(loading);
        }
        if (loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return child!;
      },
      child: ValueListenableBuilder(
        valueListenable: widget.state.errorNotifier,
        builder: (_, error, child) {
          if (widget.errorBuilder != null) {
            return widget.errorBuilder!.call(error);
          }
          if (error != null) {
            return Center(
              child: Text(error.toString()),
            );
          }
          return child!;
        },
        child: ValueListenableBuilder(
          valueListenable: widget.state.value,
          builder: (_, value, child) {
            if (widget.valueBuilder != null) {
              return widget.valueBuilder!.call(value);
            }
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (_, i) {
                final data = value[i] as SocialMediaApiViewModel;
                return ListTile(
                  title: Text(data.name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
