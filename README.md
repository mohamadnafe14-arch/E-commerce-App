<div align="center">

# 🛍️ E-Commerce App

**A Modern Flutter E-Commerce Application with Complete Shopping Experience**

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?logo=firebase)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A feature-rich e-commerce mobile application built with Flutter, offering seamless shopping experience with authentication, product browsing, cart management, secure checkout, and order tracking.

[Features](#-features) • [Screenshots](#-screenshots) • [Tech Stack](#-tech-stack) • [Getting Started](#-getting-started) • [Architecture](#-architecture)

</div>

---

## ✨ Features

### 🔐 Authentication & User Management
- **Firebase Authentication** with email/password
- **Google Sign-In** integration
- Password reset functionality
- Persistent user sessions
- User profile with account details

### 🛒 Shopping Experience
- **Product Catalog** with categories (All, Electronics, Jewelery, etc.)
- **Best Sellers** and **Top Rated** product sections
- **Product Details** with ratings, descriptions, and related products
- **Search Functionality** for quick product discovery
- **Favorites/Wishlist** with local persistence

### 🛍️ Cart & Checkout
- **Shopping Cart** with quantity management
- Add/remove items with smooth animations
- Real-time price calculations
- **Checkout Process** with order summary
- **Multiple Payment Options**:
  - Cash on Delivery
  - Credit/Debit Card (Visa/Card)

### 📦 Additional Features
- **Order Tracking** system
- **Promotional Banners** and flash sales
- **Responsive UI** with ScreenUtil
- **Offline Support** with Hive local storage
- **Bottom Navigation** for easy access
- **Notifications** for cart updates

---

## 📱 Screenshots

<div align="center">

### Onboarding & Authentication

<table>
  <tr>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.46.jpeg" width="250" alt="Onboarding"/>
      <br/>
      <b>Onboarding</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.46 (1).jpeg" width="250" alt="Sign In"/>
      <br/>
      <b>Sign In</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.47 (2).jpeg" width="250" alt="Sign Up"/>
      <br/>
      <b>Sign Up</b>
    </td>
  </tr>
</table>

### Home & Product Browsing

<table>
  <tr>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.47.jpeg" width="250" alt="Home Screen"/>
      <br/>
      <b>Home Screen</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.48.jpeg" width="250" alt="Categories"/>
      <br/>
      <b>Categories</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.49 (3).jpeg" width="250" alt="Best Sellers"/>
      <br/>
      <b>Best Sellers</b>
    </td>
  </tr>
</table>

### Product Details & Favorites

<table>
  <tr>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.47 (1).jpeg" width="250" alt="Product Details"/>
      <br/>
      <b>Product Details</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.47 (3).jpeg" width="250" alt="Top Rated"/>
      <br/>
      <b>Top Rated Products</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.47 (4).jpeg" width="250" alt="Favorites"/>
      <br/>
      <b>Favorites</b>
    </td>
  </tr>
</table>

### Cart & Checkout

<table>
  <tr>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.48 (2).jpeg" width="250" alt="Shopping Cart"/>
      <br/>
      <b>Shopping Cart</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.48 (3).jpeg" width="250" alt="Cart with Items"/>
      <br/>
      <b>Cart Management</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.49 (1).jpeg" width="250" alt="Payment"/>
      <br/>
      <b>Payment Options</b>
    </td>
  </tr>
</table>

### Search & Profile

<table>
  <tr>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.50.jpeg" width="250" alt="Search"/>
      <br/>
      <b>Product Search</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.49 (4).jpeg" width="250" alt="User Profile"/>
      <br/>
      <b>User Profile</b>
    </td>
    <td align="center">
      <img src="assest/screenshots/WhatsApp Image 2026-02-04 at 02.33.48 (4).jpeg" width="250" alt="Tracking"/>
      <br/>
      <b>Order Tracking</b>
    </td>
  </tr>
</table>

</div>

---

## 🛠️ Tech Stack

### **Core Framework**
- **Flutter** `^3.9.2` - Cross-platform UI framework
- **Dart** `^3.9.2` - Programming language

### **State Management & Architecture**
- **flutter_bloc** `^9.1.1` - BLoC pattern implementation
- **bloc** `^9.2.0` - Core BLoC library
- **equatable** `^2.0.8` - Value equality for state management
- **get_it** `^9.2.0` - Dependency injection

### **Backend & Authentication**
- **firebase_core** `^2.27.0` - Firebase core functionality
- **firebase_auth** `^4.17.0` - Authentication services
- **google_sign_in** `6.2.1` - Google OAuth integration

### **Networking & Data**
- **dio** `^5.9.0` - HTTP client for API calls
- **dartz** `^0.10.1` - Functional programming (Either, Option)

### **Local Storage**
- **hive** `^2.2.3` - Lightweight NoSQL database
- **hive_flutter** `^1.1.0` - Hive Flutter integration
- **shared_preferences** `^2.5.4` - Key-value storage

### **UI & Navigation**
- **go_router** `^17.0.1` - Declarative routing
- **flutter_screenutil** `^5.9.3` - Responsive UI scaling
- **flutter_svg** `^2.2.3` - SVG rendering
- **expandable_page_view** `^1.2.0` - Expandable page views
- **font_awesome_icon_class** `^0.0.6` - Icon library

### **Development Tools**
- **build_runner** `^2.4.13` - Code generation
- **hive_generator** `^2.0.1` - Hive type adapters generation
- **flutter_lints** `^5.0.0` - Linting rules

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a **feature-first** structure:

```
lib/
├── core/                          # Shared utilities and constants
│   ├── constants/                 # App-wide constants
│   │   └── assets.dart           # Asset paths
│   ├── errors/                    # Error handling
│   │   └── failure.dart          # Failure classes
│   ├── styles/                    # Theme and styling
│   │   └── text_styles.dart      # Text styles
│   └── utils/                     # Utilities
│       ├── api_service.dart      # API client
│       ├── app_router.dart       # Navigation routes
│       └── service_locator.dart  # DI setup
│
├── features/                      # Feature modules
│   ├── auth/                      # Authentication
│   │   ├── data/
│   │   │   ├── models/           # Data models
│   │   │   └── repos/            # Repository implementations
│   │   └── presentation/
│   │       ├── manager/          # BLoC/Cubit
│   │       └── views/            # UI screens & widgets
│   │
│   ├── products/                  # Product catalog
│   │   ├── data/
│   │   │   ├── models/           # Product models
│   │   │   └── repos/            # Product repository
│   │   └── presentation/
│   │       ├── manager/          # Products & Favorites Cubit
│   │       └── views/            # Product screens
│   │
│   ├── cart/                      # Shopping cart
│   │   ├── data/
│   │   │   ├── models/           # Cart models
│   │   │   └── repos/            # Cart repository
│   │   └── presentation/
│   │       ├── manager/          # Cart Cubit
│   │       └── views/            # Cart screens
│   │
│   ├── product_details/           # Product details
│   ├── favourite/                 # Wishlist
│   ├── checkout/                  # Checkout process
│   ├── payment/                   # Payment handling
│   ├── tracking/                  # Order tracking
│   └── profile/                   # User profile
│
├── firebase_options.dart          # Firebase configuration
└── main.dart                      # App entry point
```

### **Design Patterns Used**

- **Repository Pattern** - Data layer abstraction
- **BLoC Pattern** - State management
- **Dependency Injection** - Service locator with GetIt
- **Clean Architecture** - Separation of concerns (Data, Domain, Presentation)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.9.2`
- Dart SDK `^3.9.2`
- Firebase account (for authentication)
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mohamadnafe14-arch/E-commerce-App.git
   cd e_commerce_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for Hive adapters)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Add Android/iOS apps to your Firebase project
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the respective platform directories
   - Enable **Email/Password** and **Google Sign-In** in Firebase Authentication

5. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

---

## 📂 Project Structure Details

### **State Management Flow**

```
UI (View) → Event → Cubit → Repository → Data Source
                      ↓
                    State
                      ↓
                  UI Update
```

### **Key Components**

- **Cubits**: `AuthCubit`, `ProductsCubit`, `FavouriteProductsCubit`, `CartCubit`
- **Repositories**: Abstract interfaces with implementations
- **Models**: Data classes with JSON serialization
- **Services**: API service, local storage service

---

## 🎨 Features Breakdown

### **Authentication Flow**
1. Splash screen with app logo
2. Onboarding page view
3. Sign in / Sign up options
4. Email/password or Google authentication
5. Password reset functionality
6. Persistent login state

### **Shopping Flow**
1. Browse products by category
2. View product details with ratings
3. Add to cart or favorites
4. Manage cart quantities
5. Proceed to checkout
6. Select payment method
7. Complete order
8. Track order status

---

## 🔧 Configuration

### **API Configuration**
Update the API base URL in `lib/core/utils/api_service.dart`

### **Firebase Configuration**
Firebase options are auto-generated in `lib/firebase_options.dart`

### **Responsive Design**
The app uses `flutter_screenutil` with a design size of **430x932** (configured in `main.dart`)

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Mohamed Nafe**
- Email: mohamadnafe14@gmail.com
- GitHub: [@mohamadnafe14-arch](https://github.com/mohamadnafe14-arch)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- All open-source package contributors

---

<div align="center">

**⭐ Star this repository if you find it helpful!**

Made with ❤️ using Flutter

</div>
