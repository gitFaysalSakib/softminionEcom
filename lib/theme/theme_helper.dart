



// import 'package:flutter/material.dart';

// String _appTheme = "lightCode";
// LightCodeColors get appTheme => ThemeHelper().themeColor();
// ThemeData get theme => ThemeHelper().themeData();

// /// Helper class for managing themes and colors.
// class ThemeHelper {
//   // A map of custom color themes supported by the app
//   final Map<String, LightCodeColors> _supportedCustomColor = {
//     'lightCode': LightCodeColors(),
//   };

//   // A map of color schemes supported by the app
//   final Map<String, ColorScheme> _supportedColorScheme = {
//     'lightCode': ColorSchemes.lightCodeColorScheme,
//   };

//   /// Changes the app theme to [_newTheme].
//   void changeTheme(String _newTheme) {
//     _appTheme = _newTheme;
//   }

//   /// Returns the lightCode colors for the current theme.
//   LightCodeColors _getThemeColors() {
//     return _supportedCustomColor[_appTheme] ?? LightCodeColors();
//   }

//   /// Returns the current theme data.
//   ThemeData _getThemeData() {
//     var colorScheme =
//         _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
//     return ThemeData(
//       visualDensity: VisualDensity.standard,
//       colorScheme: colorScheme,
//       textTheme: TextThemes.textTheme(colorScheme),
//       scaffoldBackgroundColor: appTheme.gray50,
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//           shadowColor: appTheme.red8003f,
//           elevation: 4,
//           visualDensity: const VisualDensity(
//             vertical: -4,
//             horizontal: -4,
//           ),
//           padding: EdgeInsets.zero,
//         ),
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           side: BorderSide(
//             color: appTheme.gray900,
//             width: 1,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(18),
//           ),
//           visualDensity: const VisualDensity(
//             vertical: -4,
//             horizontal: -4,
//           ),
//           padding: EdgeInsets.zero,
//         ),
//       ),
//       checkboxTheme: CheckboxThemeData(
//         fillColor: MaterialStateColor.resolveWith((states) {
//           if (states.contains(MaterialState.selected)) {
//             return colorScheme.primary;
//           }
//           return Colors.transparent;
//         }),
//         side: BorderSide(
//           color: appTheme.gray500,
//           width: 1,
//         ),
//         visualDensity: const VisualDensity(
//           vertical: -4,
//           horizontal: -4,
//         ),
//       ),
//       dividerTheme: DividerThemeData(
//         thickness: 1,
//         space: 1,
//         color: appTheme.gray500.withOpacity(0.25),
//       ),
//     );
//   }

//   /// Returns the lightCode colors for the current theme.
//   LightCodeColors themeColor() => _getThemeColors();

//   /// Returns the current theme data.
//   ThemeData themeData() => _getThemeData();
// }

// /// Class containing the supported text theme styles.
// class TextThemes {
//   static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
//         bodyLarge: TextStyle(
//           color: appTheme.gray900,
//           fontSize: 16.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w400,
//         ),
//         bodyMedium: TextStyle(
//           color: appTheme.gray900,
//           fontSize: 14.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w400,
//         ),
//         bodySmall: TextStyle(
//           color: appTheme.gray500,
//           fontSize: 10.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w400,
//         ),
//         displayMedium: TextStyle(
//           color: appTheme.gray900,
//           fontSize: 44.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w600,
//         ),
//         displaySmall: TextStyle(
//           color: appTheme.gray900,
//           fontSize: 34.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w700,
//         ),
//         headlineSmall: TextStyle(
//           color: appTheme.gray900,
//           fontSize: 24.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w600,
//         ),
//         labelMedium: TextStyle(
//           color: colorScheme.onPrimary.withOpacity(1),
//           fontSize: 11.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w600,
//         ),
//         titleMedium: TextStyle(
//           color: appTheme.gray900,
//           fontSize: 16.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w600,
//         ),
//         titleSmall: TextStyle(
//           color: appTheme.gray900,
//           fontSize: 14.0,
//           fontFamily: 'Metropolis',
//           fontWeight: FontWeight.w500,
//         ),
//       );
// }

// /// Class containing the supported color schemes.
// class ColorSchemes {
//   static final lightCodeColorScheme = ColorScheme.light(
//     primary: Color(0XFFDB3022),
//     secondaryContainer: Color(0XFFF01F0E),
//     onPrimary: Color(0XB2FFFFFF),
//     onPrimaryContainer: Color(0XFF2C2C2C),
//   );
// }

// /// Class containing custom colors for a lightCode theme.
// class LightCodeColors {
//   // Amber
//   Color get amberA400 => Color(0XFFFFCC00);

//   // Black
//   Color get black900 => Color(0XFF000000);

//   // BlueGray
//   Color get blueGray400 => Color(0XFF8E8E92);

//   // DeepPurple
//   Color get deepPurple900 => Color(0XFF312280);

//   // Gray
//   Color get gray100 => Color(0XFFF6F6F6);
//   Color get gray200 => Color(0XFFF0F0F0);
//   Color get gray400 => Color(0XFFBEA8A8);
//   Color get gray40000 => Color(0X00C4C4C4);
//   Color get gray50 => Color(0XFFF9F9F9);
//   Color get gray500 => Color(0XFF9B9B9B);
//   Color get gray800 => Color(0XFF4F4F4F);
//   Color get gray900 => Color(0XFF222222);

//   // Green
//   Color get green600 => Color(0XFF2AA952);

//   // Indigo
//   Color get indigo600 => Color(0XFF3B5998);
//   Color get indigo900 => Color(0XFF151867);

//   // Orange
//   Color get orange300 => Color(0XFFFFBA48);

//   // Red
//   Color get red8003f => Color(0X3FD32525);
//   Color get red900 => Color(0XFFB72222);

//   // Yellow
//   Color get yellow800 => Color(0XFFF79E1B);
// }



/////
import 'package:flutter/material.dart';

String _appTheme = "lightCode";

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray50,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          shadowColor: appTheme.red8003f,
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray900,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: appTheme.gray500,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray500.withOpacity(0.25),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 14.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 10.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 44.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 34.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 24.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 11.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 14.0,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFDB3022),
    secondaryContainer: Color(0XFFF01F0E),
    onPrimary: Color(0XB2FFFFFF),
    onPrimaryContainer: Color(0XFF2C2C2C),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Amber
  Color get amberA400 => Color(0XFFFFCC00);

  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray400 => Color(0XFF8E8E92);

  // DeepPurple
  Color get deepPurple900 => Color(0XFF312280);

  // Gray
  Color get gray100 => Color(0XFFF6F6F6);
  Color get gray200 => Color(0XFFF0F0F0);
  Color get gray400 => Color(0XFFBEA8A8);
  Color get gray40000 => Color(0X00C4C4C4);
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray500 => Color(0XFF9B9B9B);
  Color get gray800 => Color(0XFF4F4F4F);
  Color get gray900 => Color(0XFF222222);

  // Green
  Color get green600 => Color(0XFF2AA952);

  // Indigo
  Color get indigo600 => Color(0XFF3B5998);
  Color get indigo900 => Color(0XFF151867);

  // Orange
  Color get orange300 => Color(0XFFFFBA48);

  // Red
  Color get red8003f => Color(0X3FD32525);
  Color get red900 => Color(0XFFB72222);

  // Yellow
  Color get yellow800 => Color(0XFFF79E1B);
}

