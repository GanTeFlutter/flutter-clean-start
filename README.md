Herhangi bir uygulamaya başlarken, temiz ve hızlı bir başlangıç yapmak için servisler ve bazı yapılandırmalarla uğraşmadan hızlı bir şekilde başlamak için
/1.1.1





## Kurulum

### Firebase Yapılandırması
1. Firebase Console'dan kendi projenizi oluşturun
2. `google-services.json` dosyasını `android/app/` klasörüne ekleyin
3. `GoogleService-Info.plist` dosyasını `ios/Runner/` klasörüne ekleyin
4. Firebase CLI ile: `flutterfire configure` komutunu çalıştırın

### Gerekli Bağımlılıklar
```bash
flutter pub get
```

### Çalıştırma
```bash
flutter run
```