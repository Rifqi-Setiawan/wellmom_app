# WellMom App - Architecture Documentation

## Struktur Project (MVVM dengan Riverpod)

Project ini menggunakan arsitektur **MVVM (Model-View-ViewModel)** dengan **Riverpod** untuk state management dan dependency injection.

## Struktur Folder

```
lib/
├── core/                          # Core utilities & shared code
│   ├── constants/                # App-wide constants
│   │   ├── app_colors.dart       # Color constants
│   │   └── app_strings.dart      # String constants
│   ├── errors/                    # Error handling
│   │   └── failures.dart         # Failure classes
│   ├── network/                   # Network layer
│   │   └── api_client.dart        # Dio configuration
│   ├── routing/                   # Navigation
│   │   └── app_router.dart        # Route definitions
│   ├── services/                  # Services (location, etc.)
│   │   └── location_service.dart  # Location service
│   ├── theme/                     # Theme configuration
│   │   └── app_theme.dart         # App theme
│   ├── utils/                     # Utility functions
│   │   ├── address_builder.dart   # Address formatting
│   │   └── date_formatter.dart    # Date formatting
│   └── widgets/                   # Reusable widgets
│       ├── custom_button.dart     # Custom button
│       └── custom_text_field.dart # Custom text field
│
└── features/                      # Feature modules (feature-first)
    └── auth/                      # Authentication feature
        ├── data/                  # Data layer
        │   ├── datasources/       # Remote/local data sources
        │   │   └── auth_remote_datasource.dart
        │   ├── models/            # Data models (DTOs)
        │   │   └── user_model.dart
        │   └── repositories/      # Repository implementations
        │       └── auth_repository_impl.dart
        │
        ├── domain/                # Domain layer (business logic)
        │   ├── entities/          # Domain entities
        │   │   ├── register_form_entity.dart
        │   │   └── user_entity.dart
        │   └── repositories/      # Repository interfaces
        │       └── auth_repository.dart
        │
        └── presentation/          # Presentation layer (UI)
            ├── pages/             # Screen widgets
            │   └── register_ibu_hamil_screen.dart
            ├── providers/         # Riverpod providers
            │   └── auth_providers.dart
            └── viewmodels/        # ViewModels
                └── register_view_model.dart
```

## Layer Architecture

### 1. **Presentation Layer**
- **Pages**: UI screens/widgets (hanya render & user interaction)
- **ViewModels**: State management & UI-level business logic
- **Providers**: Riverpod providers untuk dependency injection

### 2. **Domain Layer**
- **Entities**: Pure business objects (no dependencies)
- **Repositories**: Abstract interfaces (contracts)
- **Use Cases**: Business logic (optional, bisa di ViewModel)

### 3. **Data Layer**
- **Models**: Data Transfer Objects (DTOs) untuk API
- **Data Sources**: Remote/Local data sources
- **Repository Implementations**: Implementasi dari domain repositories

## Riverpod Usage

### Provider Types

1. **Provider**: Untuk dependency injection (singleton services)
   ```dart
   final locationServiceProvider = Provider<LocationService>((ref) {
     return LocationService();
   });
   ```

2. **StateNotifierProvider**: Untuk ViewModels dengan state management
   ```dart
   final registerViewModelProvider = 
       StateNotifierProvider<RegisterViewModel, RegisterState>((ref) {
     return RegisterViewModel(...);
   });
   ```

### Dependency Flow

```
UI (ConsumerWidget) 
  → ViewModel (StateNotifier)
    → Repository (interface)
      → DataSource
        → API Client (Dio)
```

## Best Practices

1. **UI hanya render state** - tidak ada business logic di UI
2. **ViewModel mengelola state** - expose methods untuk actions
3. **Repository pattern** - abstraksi data layer
4. **Entity vs Model** - Entity di domain, Model di data layer
5. **Constants** - semua string/colors di constants
6. **Reusable widgets** - di core/widgets

## Contoh Penggunaan

### Di UI (ConsumerWidget):
```dart
class RegisterScreen extends ConsumerStatefulWidget {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerViewModelProvider);
    final viewModel = ref.read(registerViewModelProvider.notifier);
    
    return CustomTextField(
      onChanged: (value) => viewModel.updateNamaLengkap(value),
    );
  }
}
```

### Di ViewModel:
```dart
class RegisterViewModel extends StateNotifier<RegisterState> {
  final AuthRepository authRepository;
  
  Future<bool> submit() async {
    final result = await authRepository.register(form);
    return result.fold(
      (failure) => false,
      (user) => true,
    );
  }
}
```

## Testing Strategy

- **Unit Tests**: ViewModels, Repositories, Use Cases
- **Widget Tests**: UI components
- **Integration Tests**: Full flows

## Next Steps

1. Implement login ViewModel & providers
2. Add use cases layer jika diperlukan
3. Add local storage (SharedPreferences/Hive)
4. Add error handling UI (snackbars, dialogs)
5. Add loading states & error states di UI
