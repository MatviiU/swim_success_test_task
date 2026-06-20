abstract interface class PaceConstants {
  static const minSeconds = 30;
  static const maxSeconds = 180;

  static const eliteThresholdSeconds = 70;
  static const advancedThresholdSeconds = 90;
  static const intermediateThresholdSeconds = 120;

  static const sliderTickSeconds = [
    eliteThresholdSeconds,
    advancedThresholdSeconds,
    intermediateThresholdSeconds,
  ];
}
