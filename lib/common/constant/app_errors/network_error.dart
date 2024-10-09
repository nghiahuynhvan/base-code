import 'package:code_base/common/constant/app_errors/app_other_error.dart';

class NetworkError extends AppOtherError {

  late final String messageError;

  NetworkError({
    super.exception,
    super.message = '',
    this.messageError = 'Network not available',
  });

  @override
  void logErrorToLogger() {
    // TODO: implement logErrorToLogger
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
