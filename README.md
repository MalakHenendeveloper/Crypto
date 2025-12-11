# Crypto Wallets 🚀

A modern, feature-rich cryptocurrency tracking application built with Flutter. This app provides real-time market data, detailed coin information, and interactive charts, all wrapped in a stunning, space-themed glassmorphism UI.

## ✨ Features

- **Real-Time Market Data**: Live tracking of cryptocurrency prices, market cap, and 24h changes.
- **Interactive Charts**: Detailed price history charts using Syncfusion for in-depth analysis.
- **Modern UI/UX**: Designed with a premium dark theme, glassmorphism effects, and smooth animations using `flutter_screenutil` for responsiveness.
- **Authentication**: Secure Login and Registration flow (UI implementation).
- **Portfolio Management**: Tools to track your crypto assets.
- **Robust Architecture**: Built using **Clean Architecture** principles to separate Data, Domain, and Presentation layers.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
- **Architecture**: MVVM + Clean Architecture
- **Networking**: [Dio](https://pub.dev/packages/dio) with Interceptors
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
- **UI Libraries**:
  - `flutter_screenutil` (Responsive Design)
  - `syncfusion_flutter_charts` (Charting)
  - `shimmer` (Loading Effects)
  - `da_glassmorph` (Glass Effects)

## 📂 Project Structure

```
lib/
├── core/           # Constants, Routes, Theme, API endpoints
├── data/           # Data Source implementations, Repositories, Models
├── domain/         # Entities, Repository Interfaces, UseCases
└── ui/             # Screens, Widgets, ViewModels (Cubits)
```

## 🚀 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/MalakHenendeveloper/Crypto.git
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run dependencies generation** (if using injectable/build_runner):
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
4.  **Run the app**:
    ```bash
    flutter run
    ```

## 👨‍💻 Author

**Malak Henen**

---
*Built with ❤️ using Flutter*
