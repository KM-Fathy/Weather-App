# ⛅ Weather App

A modern, responsive weather application built with Flutter that delivers real-time forecasts using [WeatherAPI](https://www.weatherapi.com/). The application dynamically adapts its UI gradient and color palette to match current weather conditions while maintaining clean separation of concerns via the Cubit state management pattern.

---

## 📸 Screenshots

| Initial State | Search Screen | Sunny (Cairo) | Overcast (London) |
| :---: | :---: | :---: | :---: |
| <img width="1264" height="2651" alt="home_page_with_no_weather_body" src="https://github.com/user-attachments/assets/bce13d0f-461b-4e1d-a1a4-3707b9fe1608" alt="Initial State"/> | <img width="1264" height="2651" alt="search_page" src="https://github.com/user-attachments/assets/5d41af49-2dd4-477a-87c9-ad533c3de1fd" alt="Search Screen"/> | <img width="1264" height="2651" alt="home_page_with_weather_info_body" src="https://github.com/user-attachments/assets/1d74e96b-7ea2-4b68-b3c7-44ed72bcbd4b" alt="Sunny Cairo"/> | <img width="1264" height="2651" alt="home_page_with_different_theme_weather_info_body" src="https://github.com/user-attachments/assets/4cfd2cf2-8486-4bc1-a92b-b363e4f5a94e" alt="Overcast London"/> |

---

## ✨ Features

- **Real-Time Weather Data:** Fetches live weather conditions, temperatures, and forecasts across global cities.
- **Dynamic Weather-Based Theming:** The interface background gradient and primary theme dynamically transition based on the current weather condition (e.g., warm orange for Sunny, slate blue for Overcast, cool blue for Rain).
- **Comprehensive Forecast Metrics:** Displays current temperature, daily maximum/minimum temperatures, condition descriptions, weather condition icons, and timestamp of the latest update.
- **Cubit State Management:** Predictable state transitions separating UI rendering from API networking and business logic.
- **Modular Architecture:** Clean folder structure dividing models, services, presentation views, and reusable widgets.

---

## 📂 Project Structure

```text
lib/
├── cubits/
│   └── get_weather_cubit/
│       ├── get_weather_cubit.dart      # Manages API call execution & state emissions
│       └── get_weather_states.dart     # Defines Initial, Loaded, and Failure states
├── models/
│   └── weather_model.dart             # Data model parsing JSON from WeatherAPI
├── services/
│   └── weather_service.dart           # HTTP/Dio client handling REST API requests
├── views/
│   ├── home_view.dart                 # Main screen listening to Cubit states
│   └── search_view.dart               # Search input screen to query cities
├── widgets/
│   ├── no_weather_body.dart           # Default placeholder UI prior to searching
│   └── weather_info_body.dart         # Weather display widget with dynamic gradient
└── main.dart                          # Application entry point & theme provider
```

---

## ⚙️ Architecture & State Flow

The application relies on the **Bloc / Cubit** pattern to maintain a unidirectional data flow:

1. **`WeatherInitialState`**: Displayed on app launch (`NoWeatherBody`), prompting the user to search for a city.
2. **`WeatherLoadingState`** *(Optional)*: Visual indicator while fetching data from the API.
3. **`WeatherLoadedState`**: Triggered upon a successful API response, passing `WeatherModel` to build `WeatherInfoBody` and recalculating the theme color scheme.
4. **`WeatherFailureState`**: Triggered when a network error or invalid city query occurs, presenting an informative error view.

---

## 🎨 Dynamic Theming Engine

Theme colors and background gradients update reactively based on `weatherModel.weatherState`:

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- An active API key from [WeatherAPI](https://www.weatherapi.com/)

### Installation

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/weather-app.git](https://github.com/your-username/weather-app.git)
   cd weather-app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure your API Key:**
   Open `lib/services/weather_service.dart` and add your API credentials:
   ```dart
   class WeatherService {
     final String baseUrl = "https://api.weatherapi.com/v1";
     final String apiKey = "Put Your ApiKey Here To Get News";
     // ...
   }
   ```

4. **Run the project:**
   ```bash
   flutter run
   ```

---


## 📦 Core Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - State management via Cubit
- [dio](https://pub.dev/packages/dio) - Network calls and JSON fetching
