import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success/core/errors/failures.dart';
import 'package:swim_success/features/pace_selector/domain/constants/pace_constants.dart';
import 'package:swim_success/features/pace_selector/domain/repositories/pace_repository.dart';
import 'package:swim_success/features/pace_selector/presentation/cubit/pace_state.dart';

class PaceCubit extends Cubit<PaceState> {
  PaceCubit(this.paceRepository) : super(const PaceState());

  final PaceRepository paceRepository;

  void setMinutes(int minutes) {
    _updatePace(minutes * 60 + state.seconds);
  }

  void setSeconds(int seconds) {
    final clampedSeconds = seconds.clamp(0, 59);
    _updatePace(state.minutes * 60 + clampedSeconds);
  }

  void setFromSlider(int seconds) => _updatePace(seconds);

  Future<void> submitPace(int seconds) async {
    emit(state.copyWith(status: SubmissionStatus.loading));
    try {
      await paceRepository.submitPace(seconds);
      emit(state.copyWith(status: SubmissionStatus.success));
    } on Failure catch (e) {
      emit(
        state.copyWith(status: SubmissionStatus.error, errorMessage: e.message),
      );
    }
  }

  void _updatePace(int totalSeconds) {
    final clampedSeconds = totalSeconds.clamp(
      PaceConstants.minSeconds,
      PaceConstants.maxSeconds,
    );
    if (clampedSeconds == state.paceSeconds) return;
    emit(state.copyWith(paceSeconds: clampedSeconds));
  }
}
