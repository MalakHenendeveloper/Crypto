import 'package:flutter/material.dart';

/// Dark crypto theme with minimal accent colors
class AppColors {
  // Prevent instantiation
  AppColors._();

  // ==================== Background Colors ====================
  static const bgDark = Color(0xFF0B1120);
  
  static const bgMedium = Color(0xFF1A2332);
  
  static const bgLight = Color(0xFF2A3A4F);

  // ==================== Surface Colors ====================
  static const surface = Color(0xFF1E2936);
  
  static const surfaceLight = Color(0xFF2D3B4E);

  // ==================== Text Colors ====================
  static const textPrimary = Color(0xFFE8EDF5);
  
  static const textSecondary = Color(0xFF9BA8BA);
  
  static const textMuted = Color(0xFF6B7889);

  // ==================== Accent Colors ====================

  static const success = Color(0xFF22C55E);
  
  static const successBg = Color(0xFF1A3D2A);
  
  static const danger = Color(0xFFEF4444);
  
 static const dangerBg = Color(0xFF3D1A1A);
  
  static const info = Color(0xFF3B82F6);
  
  static const infoBg = Color(0xFF1A2A3D);

  // ==================== Border Colors ====================
  static const borderSubtle = Color(0xFF2D3B4E);
  
  static const borderMedium = Color(0xFF3D4E66);
  
  static const borderBright = Color(0xFF4D5E76);

  // ==================== Shadow Colors ====================
  static const shadowDark = Color(0xFF000000);
    static const shadowGlow = Color(0xFF3B82F6);

  // ==================== Gradient ====================
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [bgDark, bgMedium, bgLight],
  );
}
