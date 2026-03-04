# Food App

A feature-rich **food delivery mobile application** built with Flutter, inspired by apps like Uber Eats and Talabat. Users can browse restaurants and menus, view food details, manage a cart, place orders, and manage their profile — all within a clean, orange-branded UI.

---

## Screenshots & Features

| Feature | Description |
|---|---|
| **Splash Screen** | Animated logo displayed for 3 seconds before navigating to login |
| **Authentication** | Login, Sign Up, Forgot Password, and OTP Verification screens |
| **Home** | Browse food categories and open restaurants |
| **Restaurant Detail** | View restaurant info, filter menu by category, and see food items |
| **Food Detail** | Select size, adjust quantity, view ingredients, and add to cart |
| **Search** | Hero-animated search bar, recent keywords, suggested restaurants, and popular fast food |
| **Search Results** | Filter food items and restaurants by keyword |
| **My Cart** | Review cart items, apply promo codes, and view order summary |
| **Payment** | Choose payment method (Cash, Visa, Mastercard, PayPal) and place order |
| **Order Accepted** | Confirmation screen with track order option |
| **My Orders** | Tabs for Ongoing and History orders with status indicators |
| **Profile** | View and edit personal info, manage saved addresses |

---

## Project Structure

```
lib/
├── main.dart                        # App entry point
├── core/
│   ├── constants/
│   │   ├── app_fonts.dart           # Font family constant (Sen)
│   │   └── app_images.dart          # All asset path constants (~50 paths)
│   ├── functions/
│   │   └── navigation.dart          # pushTo, pushReplacement, pop helpers
│   ├── styles/
│   │   ├── app_colors.dart          # 16 named color constants
│   │   ├── app_text_styles.dart     # 6 text style constants
│   │   └── app_themes.dart          # App-wide MaterialTheme (light)
│   └── widgets/
│       ├── app_button.dart          # MainButton – primary CTA button
│       ├── app_text_form_field.dart # Reusable text input
│       ├── app_password_form_field.dart # Password field with show/hide
│       ├── appbackButton.dart       # Circular back button
│       ├── circle_icon_button.dart  # Generic circle icon container
│       ├── custom_svg_picture.dart  # Tintable SVG renderer
│       ├── header_section.dart      # Reusable app bar row
│       └── rating_delivery_row.dart # Stars + fee + time row
└── features/
    ├── splash/                      # SplashScreen
    ├── auth/
    │   ├── screens/                 # Login, Signup, ForgotPassword, Verification
    │   └── widgets/                 # AuthBackground, OtpSection
    ├── home/
    │   ├── data/                    # CategoryModel, RestaurantModel, dummy data
    │   ├── screens/                 # HomeScreen
    │   └── widgets/                 # Category & restaurant cards/builders
    ├── restaurant_detail/
    │   ├── screens/                 # RestaurantDetailScreen
    │   └── widgets/                 # Image, info, filter chips, food grid
    ├── food_detail/
    │   ├── screens/                 # FoodDetailScreen
    │   └── widgets/                 # Image, info, size selector, ingredients, bottom bar
    ├── search/
    │   ├── data/                    # PopularFoodModel, dummy data, search functions
    │   ├── screens/                 # SearchScreen, SearchResultsScreen
    │   └── widgets/                 # Food cards, restaurant tiles, keyword chips
    ├── my_cart/
    │   ├── screens/                 # CartScreen, PaymentScreen, OrderAcceptedScreen
    │   └── widgets/                 # Cart item, quantity button
    ├── my_orders/
    │   ├── data/                    # OrderModel, OrderStatus enum, dummy data
    │   ├── screens/                 # MyOrdersScreen (Ongoing & History tabs)
    │   └── widgets/                 # OngoingCard, HistoryCard
    └── profile/
        ├── screens/                 # ProfileScreen, Info, Edit, Address, AddAddress
        └── widgets/                 # AddressCard, CustomChip, CustomListTile, ProfileSectionContainer
```

---

## Navigation Flow

```
SplashScreen (3s)
  └─► LoginPage
        ├─► SignupScreen ──────────────────────────► MainAppScreen
        ├─► ForgotPasswordPage ──► (back to Login)
        └─► VerificationScreen ──────────────────────► MainAppScreen

MainAppScreen (Bottom Navigation Bar)
  ├── [0] HomeScreen
  │     └─► SearchScreen
  │           └─► SearchResultsScreen
  │                 ├─► FoodDetailScreen
  │                 └─► RestaurantDetailScreen
  │                       └─► FoodDetailScreen
  ├── [1] CartScreen
  │     └─► PaymentScreen
  │           └─► OrderAcceptedScreen ──► (back to MainAppScreen)
  ├── [2] MyOrdersScreen (Ongoing | History tabs)
  └── [3] ProfileScreen
        ├─► ProfileInfoScreen
        │     └─► ProfileEditScreen
        └─► ProfileAddressScreen
              └─► AddAddressScreen
```

Navigation is fully **imperative** using helper functions (`pushTo`, `pushReplacement`, `pop`). No named routes. **Hero animations** are applied on restaurant images, food images, and the search bar.

---

## Data Models

| Model | Key Fields |
|---|---|
| `CategoryModel` | `id`, `name`, `image` |
| `RestaurantModel` | `id`, `name`, `image`, `tags[]`, `rating`, `deliveryFee`, `deliveryTime`, `description` |
| `PopularFoodModel` | `id`, `name`, `restaurantName`, `restaurantId`, `category`, `image`, `price`, `rating`, `deliveryFee`, `deliveryTime`, `description` |
| `OrderModel` | `id`, `restaurantName`, `image`, `price`, `itemsCount`, `date`, `type`, `status` |
| `OrderStatus` | enum: `ongoing`, `completed`, `canceled` |

> All data is **static/hardcoded** — no backend, REST API, or database integration.

---

## State Management

Plain **Flutter `setState`** is used throughout — no external state management library:

| Screen / Widget | State |
|---|---|
| `MainAppScreen` | Active bottom nav tab index |
| `FoodDetailScreen` | Quantity, selected size, favourite toggle |
| `RestaurantDetailScreen` | Selected category filter index |
| `PaymentScreen` | Selected payment method index |
| `SearchScreen` / `SearchResultsScreen` | Search query, filtered results |
| `OtpSection` | OTP digit controllers, focus, resend countdown timer |
| `CustomChip` | Selected / unselected toggle |

---

## Tech Stack & Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK | Core framework |
| `flutter_svg` | ^2.2.3 | SVG asset rendering |
| `intl` | ^0.20.2 | Date formatting on order history |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |

**Custom font:** Sen (Regular 400, SemiBold 600, Bold 700) from `assets/fonts/`.

---

## Assets

```
assets/
├── fonts/            # Sen-Regular.ttf, Sen-Bold.ttf, Sen-SemiBold.ttf
├── icons/
│   ├── bottom_nav/   # SVG icons for the 4 bottom nav tabs
│   ├── pattern_icons/# Decorative SVG background patterns
│   ├── payment_icons/# Cash, Visa, Mastercard, PayPal icons
│   ├── profile/      # Profile section SVG icons
│   └── social_icons/ # Facebook, Twitter, Apple login icons
└── images/           # Food category images (pizza, burger, chicken, etc.)
```

---

## Getting Started

### Prerequisites

- Flutter SDK `^3.10.3`
- Dart SDK `^3.10.3`
- Android Studio / Xcode (for device/emulator)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd food_app

# Install dependencies
flutter pub get

# Run on a connected device or emulator
flutter run
```

### Build

```bash
# Android APK
flutter build apk --release

# iOS (macOS only)
flutter build ios --release
```

---

## Known Limitations

- **No backend integration** — all data is hardcoded dummy data.
- **Cart is UI-only** — items are not persisted; adding to cart shows a SnackBar but doesn't update cart state globally.
- **No real authentication** — forms validate input but do not connect to any auth service.
- **Payment is a mock** — the payment flow navigates through screens without processing a real transaction.
- **Category taps on Home** — `CategoryCard` tap handlers are currently empty (`onTap: () {}`).

---

## License

This project is private and not intended for publication to pub.dev.
