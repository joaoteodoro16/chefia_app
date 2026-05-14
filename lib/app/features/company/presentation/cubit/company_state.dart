import 'package:equatable/equatable.dart';

enum CompanyStatus { initial, loading, success, error }

class CompanyState extends Equatable {
  final CompanyStatus status;
  final String? errorMessage;
  

  const CompanyState({required this.status, this.errorMessage});

  const CompanyState.initial()
    : status = CompanyStatus.initial,
      errorMessage = null;

  @override
  List<Object?> get props => [status, errorMessage];

  CompanyState copyWith({CompanyStatus? status, String? errorMessage}) {
    return CompanyState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
