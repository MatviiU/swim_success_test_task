import 'package:equatable/equatable.dart';
import 'package:swim_success/features/pace_selector/domain/entities/swimmer_level.dart';

enum SubmissionStatus { idle, loading, success, error }

class PaceState extends Equatable {
  const PaceState({
    this.paceSeconds = 90,
    this.status = SubmissionStatus.idle,
    this.errorMessage,
  });

  final int paceSeconds;
  final SubmissionStatus status;
  final String? errorMessage;

  int get minutes => paceSeconds ~/ 60;
  int get seconds => paceSeconds % 60;
  SwimmerLevel get swimmerLevel => SwimmerLevel.fromSeconds(paceSeconds);

  bool get isSubmitting => status == SubmissionStatus.loading;

  PaceState copyWith({
    int? paceSeconds,
    SubmissionStatus? status,
    String? errorMessage,
    bool clearError = false,
  }) {
    return PaceState(
      paceSeconds: paceSeconds ?? this.paceSeconds,
      status: status ?? this.status,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [paceSeconds, status, errorMessage];
}
