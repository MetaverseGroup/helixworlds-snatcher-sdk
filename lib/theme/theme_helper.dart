import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/utils/pref_utils.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  String? _appTheme;
  ThemeHelper(PrefUtils prefUtil) {
    _appTheme = prefUtil.getThemeData();
  }

  // The current app theme

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray900,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.limeA200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appTheme.blueGray70001,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray800,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 34.fSize,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray500,
          fontSize: 12.fSize,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 20.fSize,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 17.fSize,
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'SF Compact',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => const Color(0XFF000000);

  // BlueGray
  Color get blueGray400 => const Color(0XFF888888);
  Color get blueGray700 => const Color(0XFF45495E);
  Color get blueGray70001 => const Color(0XFF44495D);
  Color get blueGray800 => const Color(0XFF383A4E);
  Color get blueGray900 => const Color(0XFF292D32);

  // Gray
  Color get gray500 => const Color(0XFFAAAAAA);
  Color get gray900 => const Color(0XFF0E0725);

  // Indigo
  Color get indigo100 => const Color(0XFFBEC2D7);

  // Lime
  Color get limeA200 => const Color(0XFFDEFE48);

  // White
  Color get whiteA700 => const Color(0XFFFFFFFF);

  // Yellow
  Color get yellowA700 => const Color(0XFFFFD60A);
}
