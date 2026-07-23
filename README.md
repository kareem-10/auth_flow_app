# Auth Flow App - Supabase Authentication Starter

Complete authentication system built with Flutter and Supabase, featuring email, social login, magic link, and phone authentication.

## Features

This starter project includes the complete structure for:

- ✅ Email & Password Authentication
- ✅ Social Login (Google, Apple, GitHub)
- ✅ Magic Link Authentication (Passwordless)
- ✅ Phone Authentication with OTP
- ✅ Session Management & Persistence
- ✅ Profile Management
- ✅ Clean Architecture with BLoC
- ✅ Error Handling with Either Pattern
- ✅ Dependency Injection with get_it

## Project Structure

```
lib/
├── core/
│   ├── di/
│   │   └── injection_container.dart    # Dependency injection setup
│   └── error/
│       ├── exceptions.dart              # Custom exceptions
│       └── failures.dart                # Failure classes for error handling
│
└── features/
    └── auth/
        ├── data/
        │   ├── datasources/
        │   │   └── auth_remote_datasource.dart   # Supabase API calls
        │   ├── models/
        │   │   └── user_model.dart               # User data model
        │   └── repositories/
        │       └── auth_repository_impl.dart     # Repository implementation
        │
        ├── domain/
        │   ├── entities/
        │   │   └── user_entity.dart              # User domain entity
        │   └── repositories/
        │       └── auth_repository.dart          # Repository interface
        │
        └── presentation/
            ├── bloc/
            │   ├── auth_bloc.dart                # Authentication BLoC
            │   ├── auth_event.dart               # Auth events
            │   └── auth_state.dart               # Auth states
            └── pages/
                ├── home_page.dart                # Home screen (authenticated)
                └── login_page.dart               # Login screen
```

## Architecture Overview

This project follows **Clean Architecture** principles:

### Layers

1. **Domain Layer** (Business Logic)
    - Entities: Pure Dart classes representing core business objects
    - Repositories: Interfaces defining data operations

2. **Data Layer** (Data Sources)
    - Models: Data transfer objects with JSON serialization
    - Data Sources: API calls to Supabase
    - Repository Implementations: Concrete implementations of domain repositories

3. **Presentation Layer** (UI)
    - BLoC: State management using flutter_bloc
    - Pages/Widgets: UI components

### Key Patterns

- **Dependency Injection**: Using `get_it` for service location
- **Either Pattern**: Using `dartz` for functional error handling
- **BLoC Pattern**: For state management and separating business logic from UI
