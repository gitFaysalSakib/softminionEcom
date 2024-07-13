import 'package:flutter/material.dart';
import 'package:softminion/theme/theme_helper.dart';
extension on TextStyle {
TextStyle get metropolis {
return copyWith(
fontFamily: 'Metropolis',
);
}
}



class CustomTextStyles {
// Body text style
static get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
  color: appTheme.gray500,
);
static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
  color: appTheme.black900,
);
static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
  color: appTheme.gray500,
  fontSize: 13.0,
);
static get bodyMediumGray500_1 => theme.textTheme.bodyMedium!.copyWith(
  color: appTheme.gray500,
);
static get bodyMediumGray500_2 => theme.textTheme.bodyMedium!.copyWith(
  color: appTheme.gray500,
);
static get bodyMediumGray800 => theme.textTheme.bodyMedium!.copyWith(
  color: appTheme.gray800,
);
static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
  color: appTheme.gray900.withOpacity(0.8),
);
static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
  fontSize: 11.0,
);
static get bodySmall11_1 => theme.textTheme.bodySmall!.copyWith(
  fontSize: 11.0,
);
static get bodySmall11_2 => theme.textTheme.bodySmall!.copyWith(
  fontSize: 11.0,
);
static get bodySmall11_3 => theme.textTheme.bodySmall!.copyWith(
  fontSize: 11.0,
);
static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
  color: appTheme.gray900,
  fontSize: 11.0,
);
static get bodySmallGray90011 => theme.textTheme.bodySmall!.copyWith(
  color: appTheme.gray900,
  fontSize: 11.0,
);
static get bodySmallGray90011_1 => theme.textTheme.bodySmall!.copyWith(
color: appTheme.gray900,
fontSize: 11.0,
);
static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
color: theme.colorScheme.primary,
);
static get bodySmallSecondaryContainer => theme.textTheme.bodySmall!.copyWith(
color: theme.colorScheme.secondaryContainer,
fontSize: 11.0,
);
// Display text style
static get displayMediumOnPrimary => theme.textTheme.displayMedium!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
fontSize: 48.0,
fontWeight: FontWeight.w900,
);
static get displaySmallBlack900 => theme.textTheme.displaySmall!.copyWith(
color: appTheme.black900,
);
static get displaySmallOnPrimary => theme.textTheme.displaySmall!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
fontWeight: FontWeight.w900,
);
static get displaySmallOnPrimary_1 => theme.textTheme.displaySmall!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
);
static get displaySmallPrimary => theme.textTheme.displaySmall!.copyWith(
color: theme.colorScheme.primary,
);
// Headline text style
static get headlineSmallOnPrimary => theme.textTheme.headlineSmall!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
);
static get headlineSmallOnPrimaryRegular =>
theme.textTheme.headlineSmall!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
fontWeight: FontWeight.w400,
);

static get headlineSmall0nPrimary_1 =>
theme.textTheme.headlineSmall!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
);
static get headlineSmall0nPrimary_2 =>
theme.textTheme.headlineSmall!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
);
static get headlineSmall_1 => theme.textTheme.headlineSmall!;
// Label text style
static get labelMedium10 => theme.textTheme.labelMedium!.copyWith(
fontSize: 10.0,
);
static get labelMediumGray500 => theme.textTheme.labelMedium!.copyWith(
color: appTheme.gray500,
fontSize: 10.0,
);
static get labelMediumGray900 => theme.textTheme.labelMedium!.copyWith(
color: appTheme.gray900,
);
// static get labelMediumOnPrimary => theme.textTheme.labelMedium!.copyWith(
// color: theme.colorScheme.onPrimary.withOpacity(0.8),
// fontSize: 10.0,
// );
static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
color: theme.colorScheme.primary,
fontSize: 10.0,
);

static get hintlable => theme.textTheme.labelMedium!.copyWith(
color: theme.colorScheme.primary,
fontSize: 10.0,
);
// Title text style
static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
fontSize: 18.0,
);
static get titleMedium18_1 => theme.textTheme.titleMedium!.copyWith(
fontSize: 18.0,
);
static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
color: appTheme.black900,
fontSize: 18.0,
);

static get titleMediumBlack90018 => theme.textTheme.titleMedium!.copyWith(
  color: appTheme.black900,
  fontSize: 18.0,
);
static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
  color: appTheme.black900,
);
static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
  color: appTheme.gray500,
);
static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
  color: theme.colorScheme.onPrimary.withOpacity(1),
);
static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
  color: theme.colorScheme.primary,
);
static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
  fontWeight: FontWeight.w700,
);
static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
  color: appTheme.gray500,
);
static get titleSmallGreen600 => theme.textTheme.titleSmall!.copyWith(
  color: appTheme.green600,
);
static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
  color: theme.colorScheme.onPrimary.withOpacity(1),
  fontWeight: FontWeight.w600,
);
static get titleSmall0nPrimaryBold => theme.textTheme.titleSmall!.copyWith(
  color: theme.colorScheme.onPrimary.withOpacity(1),
  fontWeight: FontWeight.w700,
);
static get titleSmall0nPrimaryContainer =>
  theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onPrimaryContainer,
  );

static get titleSmallOnPrimary_1 => theme.textTheme.titleSmall!.copyWith(
color: theme.colorScheme.onPrimary.withOpacity(1),
);
static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
color: theme.colorScheme.primary,
);
static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
fontWeight: FontWeight.w600,
);
}