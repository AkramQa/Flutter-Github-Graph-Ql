import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_task/core/domain/utils/network/constants.dart';


import '../../domain/entities/failures.dart';



mixin ScreenUtils<T extends StatefulWidget> on State<T> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? handleError(
      {Failure? failure,
      String? customMessage,
      Map<ServerErrorCode, String>? customMessages,
      bool isFloating = false}) {
    return showError(
        failure: failure,
        customMessage: customMessage,
        customMessages: customMessages,
        isFloating: isFloating);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      {Failure? failure,
      String? customMessage,
      Map<ServerErrorCode, String>? customMessages,
      bool isFloating = false}) {
    String message = customMessage ?? 'error_message'.tr();
    if (failure != null && failure is ServerFailure) {
      if (failure.errorCode == ServerErrorCode.noInternetConnection) {
        message = 'no_internet_connection_message'.tr();
      } else if (failure.errorCode == ServerErrorCode.ServerError) {
        message = failure.message.isNotEmpty
            ? failure.message
            : 'server_not_working'.tr();
      } else if (failure.errorCode == ServerErrorCode.forbidden) {
        message = failure.message.isNotEmpty
            ? failure.message
            : 'access_denied_message'.tr();
      } else if (failure.errorCode == ServerErrorCode.unauthenticated) {
        message = failure.message.isNotEmpty
            ? failure.message
            : 'unauthenticated_message'.tr();
      } else if (failure.message.isNotEmpty) {
        message = failure.message;
      } else if (customMessages != null && customMessages.isNotEmpty) {
        message = customMessages[failure.errorCode] ?? 'error_message'.tr();
      }
    } else if (failure != null && failure is LogicFailure) {
      if (failure.message.isNotEmpty) {
        message = failure.message;
      }
    } else if (failure != null && failure is AppAccessDeniedFailure) {
      message = 'no_access'.tr();
    }
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      content: Row(children: [
        Flexible(
          child: Text(
            message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
            // overflow: TextOverflow.ellipsis,
          ),
        )
      ]),
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
      {String? customMessage, bool isFloating = false}) {
    String message = customMessage ?? 'success'.tr();

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      // margin: EdgeInsets.symmetric(vertical: 10.h),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }
}
