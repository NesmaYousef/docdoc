# 🏥 Mediqa

Mediqa  is a premium, high-performance medical appointment scheduling application built with Flutter. Designed with a strict adherence to **Clean Architecture** and SOLID principles, the application delivers a seamless, instant, and offline-capable user experience for browsing medical specializations, locating nearby doctors, and securely booking appointments.

---

## ✨ Features & Architecture Highlights

- ⚡ Zero-delay loading for returning users via intelligent caching
- 🔒 Secure authentication with token-based authorization
- 📱 Cross-platform support 
- 🏗️ Clean Architecture with strict separation of concerns
- 🎨 Modern UI/UX with Glassmorphism effects and custom animations
- 🌐 Offline-first approach with background synchronization
---

## 🛠️ Technology Stack
* **Framework:** Flutter (`^3.10.4`)
* **State Management:** `flutter_bloc`
* **Dependency Injection:** `get_it`
* **Networking:** `dio`, `retrofit`
* **Local Persistence:** `hive`, `hive_flutter`, `shared_preferences`
* **Code Generation:** `build_runner`, `freezed`, `json_serializable`

---

## 🔧 Getting Started

This project uses `build_runner` for generating data models and network interfaces. When pulling this repository for the first time, or after modifying complex models, be sure to fetch your dependencies and execute the builder:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Building the Application
Run the standard build commands to compile the application for your target environment:
```bash
flutter run
```
