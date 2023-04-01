import 'package:flutter/material.dart';
import 'package:generic_flutter/api_view/api_view.dart';

class ApiViewBaseState<T extends ApiViewBaseModel> {
  final ApiBaseService<T> service;
  ApiViewBaseState(this.service);

  Future<void> next() async {
    try {
      loadingNotifier.value = true;
      final respose = await service.next();
      value.value = [...value.value, ...respose];
      loadingNotifier.value = false;
    } catch (e) {
      loadingNotifier.value = false;
      errorNotifier.value = e.toString();

      ///ToDo::
    }
  }

  void dispose() {
    loadingNotifier.dispose();
    errorNotifier.dispose();
    value.dispose();
  }

  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);
  final ValueNotifier<String?> errorNotifier = ValueNotifier(null);
  final ValueNotifier<List<T>> value = ValueNotifier([]);
}
