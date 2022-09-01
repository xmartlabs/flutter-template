class AppDimens {
  final int spacing2;
  final int spacing4;
  final int spacing8;
  final int spacing12;
  final int spacing16;
  final int spacing20;
  final int spacing24;

  AppDimens({
    required this.spacing2,
    required this.spacing4,
    required this.spacing8,
    required this.spacing12,
    required this.spacing16,
    required this.spacing20,
    required this.spacing24,
  });

  static AppDimens getDimensions() => AppDimens(
        spacing2: 2,
        spacing4: 4,
        spacing8: 8,
        spacing12: 12,
        spacing16: 16,
        spacing20: 20,
        spacing24: 24,
      );
}
