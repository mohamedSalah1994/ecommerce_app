import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: Text('loading'),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? const Center(
                child: Text('offlineFailure'),
              )
            : statusRequest == StatusRequest.serverFailure
                ? const Center(
                    child: Text('serverFailure'),
                  )
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child: Text('failure'),
                      )
                    : widget;
  }
}
