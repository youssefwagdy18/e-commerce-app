class FailureEntity{
  String? errorMsg;
  FailureEntity({required this.errorMsg});
}

class ServerAuthFailureEntity extends FailureEntity{
  ServerAuthFailureEntity({required super.errorMsg});
}

class NetworkAuthFailureEntity extends FailureEntity{
  NetworkAuthFailureEntity({required super.errorMsg});
}