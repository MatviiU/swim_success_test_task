enum SwimmerLevel {
  beginner('Beginner'),
  intermediate('Intermediate'),
  advanced('Advanced'),
  elite('Elite');

  const SwimmerLevel(this.label);

  factory SwimmerLevel.fromSeconds(int seconds) {
    if (seconds < 70) return SwimmerLevel.elite;
    if (seconds < 90) return SwimmerLevel.advanced;
    if (seconds < 120) return SwimmerLevel.intermediate;
    return SwimmerLevel.beginner;
  }

  final String label;
}
