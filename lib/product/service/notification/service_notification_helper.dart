// lib/core/utils/notification_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_base_start/product/constant/app_keys.dart';

class NotificationHelper {
  NotificationHelper._();

  static BuildContext? get _context => AppKeys.context;
  static OverlayState? get _overlay => AppKeys.overlay;

  // ============================================
  //  (SnackBar)
  // ============================================

  /// Genel SnackBar gösterme metodu
  static void _showSnackBar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final ctx = _context;
    if (ctx == null) return;

    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Alttan gelen başarı bildirimi (yeşil)
  static void showSuccessSnackBar(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  /// Alttan gelen uyarı bildirimi (turuncu)
  static void showWarningSnackBar(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning_amber_rounded,
    );
  }

  /// Alttan gelen hata bildirimi (kırmızı)
  static void showErrorSnackBar(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error_outline,
    );
  }

  /// Alttan gelen bilgi bildirimi (mavi)
  static void showInfoSnackBar(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info_outline,
    );
  }

  // ============================================
  // ÜSTTEN GELEN BİLDİRİMLER (Top SnackBar)
  // ============================================

  /// Üstten gelen özelleştirilebilir bildirim
  static void showTopSnackBar({
    required String message,
    Color? backgroundColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlayState = _overlay;
    if (overlayState == null) return;

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (overlayContext) => _TopSnackBarWidget(
        message: message,
        backgroundColor: backgroundColor,
        icon: icon,
        onClose: () {
          if (overlayEntry.mounted) {
            overlayEntry.remove();
          }
        },
      ),
    );

    overlayState.insert(overlayEntry);

    // Otomatik kapat
    Future.delayed(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  /// Üstten başarı bildirimi
  static void showTopSuccessSnackBar(String message) {
    showTopSnackBar(
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  /// Üstten hata bildirimi
  static void showTopErrorSnackBar(String message) {
    showTopSnackBar(
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error_outline,
    );
  }

  /// Üstten uyarı bildirimi
  static void showTopWarningSnackBar(String message) {
    showTopSnackBar(
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning_amber_rounded,
    );
  }

  /// Üstten bilgi bildirimi
  static void showTopInfoSnackBar(String message) {
    showTopSnackBar(
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info_outline,
    );
  }
}

// ============================================
// ÖZEL WIDGET: Üstten Gelen Bildirim
// ============================================

class _TopSnackBarWidget extends StatelessWidget {
  const _TopSnackBarWidget({
    required this.message,
    required this.onClose,
    this.backgroundColor,
    this.icon,
  });
  final String message;
  final Color? backgroundColor;
  final IconData? icon;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: -100, end: 0),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, value),
              child: child,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: onClose,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
