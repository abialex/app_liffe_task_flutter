enum AppSpacingEnum {
  none(0),
  extraSmall(4),
  small(8),
  smallMedium(12),
  medium(16),
  mediumLarge(20),
  large(24),
  extraLarge(32);

  const AppSpacingEnum(this.size);
  final double size;
}
