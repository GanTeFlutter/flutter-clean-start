// lib/features/test/notification_test_view.dart
import 'package:flutter/material.dart';

import 'package:flutter_base_start/product/service/notification/service_notification_helper.dart';

class NotificationTestView extends StatelessWidget {
  const NotificationTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirim Test Sayfası'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ALTTAN GELEN BİLDİRİMLER
            _buildSectionTitle('📍 Alttan Gelen Bildirimler (SnackBar)'),
            const SizedBox(height: 12),

            _buildTestButton(
              context,
              label: '✅ Başarı Bildirimi',
              color: Colors.green,
              onPressed: () {
                NotificationHelper.showSuccessSnackBar(
                  'İşlem başarıyla tamamlandı!',
                );
              },
            ),

            _buildTestButton(
              context,
              label: '⚠️ Uyarı Bildirimi',
              color: Colors.orange,
              onPressed: () {
                NotificationHelper.showWarningSnackBar(
                  'Dikkat! Bu işlem geri alınamaz.',
                );
              },
            ),

            _buildTestButton(
              context,
              label: '❌ Hata Bildirimi',
              color: Colors.red,
              onPressed: () {
                NotificationHelper.showErrorSnackBar(
                  'Bir hata oluştu. Lütfen tekrar deneyin.',
                );
              },
            ),

            _buildTestButton(
              context,
              label: 'ℹ️ Bilgi Bildirimi',
              color: Colors.blue,
              onPressed: () {
                NotificationHelper.showInfoSnackBar(
                  'Yeni özellikler eklendi. Keşfetmeye başlayın!',
                );
              },
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            // ÜSTTEN GELEN BİLDİRİMLER
            _buildSectionTitle('📍 Üstten Gelen Bildirimler (Top SnackBar)'),
            const SizedBox(height: 12),

            _buildTestButton(
              context,
              label: '✅ Üstten Başarı',
              color: Colors.green.shade700,
              onPressed: () {
                NotificationHelper.showTopSuccessSnackBar(
                  'Dosya başarıyla yüklendi!',
                );
              },
            ),

            _buildTestButton(
              context,
              label: '⚠️ Üstten Uyarı',
              color: Colors.orange.shade700,
              onPressed: () {
                NotificationHelper.showTopWarningSnackBar(
                  'Bağlantı zayıf, kontrol edin.',
                );
              },
            ),

            _buildTestButton(
              context,
              label: '❌ Üstten Hata',
              color: Colors.red.shade700,
              onPressed: () {
                NotificationHelper.showTopErrorSnackBar(
                  'Sunucuya bağlanılamadı!',
                );
              },
            ),

            _buildTestButton(
              context,
              label: 'ℹ️ Üstten Bilgi',
              color: Colors.blue.shade700,
              onPressed: () {
                NotificationHelper.showTopInfoSnackBar(
                  'Güncelleme mevcut. Şimdi indir!',
                );
              },
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            // KARMA TEST
            _buildSectionTitle('🎯 Karma Test'),
            const SizedBox(height: 12),

            _buildTestButton(
              context,
              label: '🎪 Hepsini Göster (5 saniye aralıklarla)',
              color: Colors.purple,
              onPressed: () => _showAllNotifications(),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTestButton(
    BuildContext context, {
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showAllNotifications() async {
    // Alttan bildirimler
    NotificationHelper.showSuccessSnackBar('1/8: Alttan başarı bildirimi');
    await Future.delayed(const Duration(seconds: 5));

    NotificationHelper.showWarningSnackBar('2/8: Alttan uyarı bildirimi');
    await Future.delayed(const Duration(seconds: 5));

    NotificationHelper.showErrorSnackBar('3/8: Alttan hata bildirimi');
    await Future.delayed(const Duration(seconds: 5));

    NotificationHelper.showInfoSnackBar('4/8: Alttan bilgi bildirimi');
    await Future.delayed(const Duration(seconds: 5));

    // Üstten bildirimler
    NotificationHelper.showTopSuccessSnackBar('5/8: Üstten başarı bildirimi');
    await Future.delayed(const Duration(seconds: 5));

    NotificationHelper.showTopWarningSnackBar('6/8: Üstten uyarı bildirimi');
    await Future.delayed(const Duration(seconds: 5));

    NotificationHelper.showTopErrorSnackBar('7/8: Üstten hata bildirimi');
    await Future.delayed(const Duration(seconds: 5));

    NotificationHelper.showTopInfoSnackBar('8/8: Tüm testler tamamlandı! ✅');
  }
}
