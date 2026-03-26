# 🏥 Mediqa

Mediqa  is a premium, high-performance medical appointment scheduling application built with Flutter. Designed with a strict adherence to **Clean Architecture** and SOLID principles, the application delivers a seamless, instant, and offline-capable user experience for browsing medical specializations, locating nearby doctors, and securely booking appointments.

---

## ✨ Features & Architecture Highlights

### 🚀 Ultra-Fast Offline Caching (Stale-While-Revalidate)
Mediqa guarantees a **0ms loading delay** for returning users by implementing the industry-standard **Stale-While-Revalidate** caching pattern. 
* The application intelligently pings the API in the background—silently updating the UI if new data exists, while gracefully suppressing network errors if you are completely offline!

### 🏗️ Clean Architecture
The codebase uses a highly modular feature-driven folder structure ensuring absolute scalability for enterprise teams:
* **UI Layer:** Exclusively handles rendering components, scalable custom Glassmorphism widgets, and routing.
* **Logic Layer:** Employs **Cubit** (`flutter_bloc`) to strictly isolate UI business logic from networking tasks. 
* **Data Layer:** Utilizes heavily segmented **Repositories** to broker data requests using generated code patterns.

### 🌐 Secure Networking
* Fully integrated with **Dio** and **Retrofit** to auto-generate heavily typed API endpoint scaffolding.
* Centralized `ApiErrorHandler` gracefully handles all backend exception classes, mapped securely to clean, user-facing UI messages without crashing the main application thread.

### 💉 Dependency Injection
* Centralized **GetIt** service locators handle efficient instantiation of API Services and Cubits.
* Employs state-sharing **LazySingletons** (e.g., `HomeCubit`, `ProfileCubit`) to surgically prevent redundant API fetching across completely different modules (like routing from Home to Settings to the Search Tab), drastically reducing network payloads.

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
