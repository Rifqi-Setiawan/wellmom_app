# Task: Implement AI Chatbot Feature for WellMom Flutter App

## Project Context

WellMom adalah aplikasi Flutter untuk monitoring kesehatan ibu hamil. Kita perlu menambahkan fitur AI Chatbot (WellBot) yang dapat diakses dari halaman Konsul. Backend API sudah siap di `http://103.191.92.29:8000/api/v1/chatbot/`.

## Existing Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart
│   ├── network/
│   │   └── api_client.dart          # Dio provider, base URL
│   ├── routing/
│   │   └── app_router.dart          # Route definitions
│   ├── widgets/
│   │   └── custom_button.dart, etc
│   └── errors/
│       └── failures.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/         # Remote data sources
│   │   │   ├── models/              # Freezed models
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── pages/
│   │       ├── providers/           # Riverpod providers
│   │       └── viewmodels/          # StateNotifier
│   ├── konsul/
│   │   └── presentation/pages/konsul_screen.dart  # WellBot button here
│   └── ...
└── main.dart
```

## Existing Patterns to Follow

### 1. State Management: Riverpod + StateNotifier
```dart
// State class
class ExampleState {
  final bool isLoading;
  final String? error;
  // ...
  ExampleState copyWith({...});
}

// ViewModel
class ExampleViewModel extends StateNotifier<ExampleState> {
  ExampleViewModel() : super(const ExampleState());
  // methods...
}

// Provider
final exampleViewModelProvider = StateNotifierProvider<ExampleViewModel, ExampleState>((ref) {
  return ExampleViewModel();
});
```

### 2. API Calls: Dio + Remote DataSource
```dart
abstract class ExampleRemoteDataSource {
  Future<Model> fetchData();
}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  final Dio dio;
  ExampleRemoteDataSourceImpl(this.dio);
  
  @override
  Future<Model> fetchData() async {
    try {
      final response = await dio.get('/endpoint');
      return Model.fromJson(response.data);
    } on DioException catch (e) {
      // Error handling...
    }
  }
}
```

### 3. Models: Freezed + JsonSerializable
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Model with _$Model {
  const factory Model({
    required int id,
    required String name,
  }) = _Model;

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}
```

### 4. Navigation
```dart
// In app_router.dart
static const String chatbot = '/chatbot';

// In generateRoute
case chatbot:
  return MaterialPageRoute(
    builder: (_) => const ChatbotScreen(),
    settings: settings,
  );

// Usage
Navigator.of(context).pushNamed(AppRouter.chatbot);
```

---

## Backend API Endpoints

Base URL: `http://103.191.92.29:8000/api/v1`

### 1. Send Message
```
POST /chatbot/send?conversation_id={id}  (conversation_id optional)
Headers: Authorization: Bearer {token}
Body: { "message": "string" }
Response: {
  "response": "string",
  "conversation_id": int,
  "quota": {
    "used_today": int,
    "limit": int,
    "remaining": int,
    "resets_at": "datetime"
  }
}
```

### 2. Get Conversations List
```
GET /chatbot/conversations?skip=0&limit=20
Headers: Authorization: Bearer {token}
Response: [
  {
    "id": int,
    "title": "string",
    "created_at": "datetime",
    "updated_at": "datetime",
    "message_count": int
  }
]
```

### 3. Get Conversation History
```
GET /chatbot/conversations/{conversation_id}
Headers: Authorization: Bearer {token}
Response: {
  "conversation": {...},
  "messages": [
    {
      "id": int,
      "role": "user" | "assistant",
      "content": "string",
      "created_at": "datetime"
    }
  ]
}
```

### 4. Get Quota
```
GET /chatbot/quota
Headers: Authorization: Bearer {token}
Response: {
  "used_today": int,
  "limit": int,
  "remaining": int,
  "resets_at": "datetime"
}
```

### 5. Delete Conversation
```
DELETE /chatbot/conversations/{conversation_id}
Headers: Authorization: Bearer {token}
Response: { "message": "string" }
```

---

## Implementation Requirements

### 1. Create Feature Folder Structure
```
lib/features/chatbot/
├── data/
│   ├── datasources/
│   │   └── chatbot_remote_datasource.dart
│   └── models/
│       ├── chatbot_message_model.dart
│       ├── chatbot_conversation_model.dart
│       ├── chatbot_send_response_model.dart
│       └── chatbot_quota_model.dart
├── domain/
│   └── entities/
│       └── (optional - can use models directly)
└── presentation/
    ├── pages/
    │   ├── chatbot_screen.dart           # Main chat interface
    │   └── chatbot_history_screen.dart   # List of past conversations
    ├── providers/
    │   └── chatbot_providers.dart
    ├── viewmodels/
    │   └── chatbot_view_model.dart
    └── widgets/
        ├── chat_bubble.dart
        ├── chat_input.dart
        └── quota_indicator.dart
```

### 2. Models (using Freezed)

**chatbot_message_model.dart:**
```dart
@freezed
class ChatbotMessageModel with _$ChatbotMessageModel {
  const factory ChatbotMessageModel({
    required int id,
    required String role,        // "user" or "assistant"
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ChatbotMessageModel;

  factory ChatbotMessageModel.fromJson(Map<String, dynamic> json) => 
      _$ChatbotMessageModelFromJson(json);
}
```

**chatbot_quota_model.dart:**
```dart
@freezed
class ChatbotQuotaModel with _$ChatbotQuotaModel {
  const factory ChatbotQuotaModel({
    @JsonKey(name: 'used_today') required int usedToday,
    required int limit,
    required int remaining,
    @JsonKey(name: 'resets_at') required DateTime resetsAt,
  }) = _ChatbotQuotaModel;

  factory ChatbotQuotaModel.fromJson(Map<String, dynamic> json) => 
      _$ChatbotQuotaModelFromJson(json);
}
```

### 3. Remote DataSource

```dart
abstract class ChatbotRemoteDataSource {
  Future<ChatbotSendResponseModel> sendMessage(String message, int? conversationId, String token);
  Future<List<ChatbotConversationModel>> getConversations(String token, {int skip = 0, int limit = 20});
  Future<ChatbotHistoryModel> getConversationHistory(int conversationId, String token);
  Future<ChatbotQuotaModel> getQuota(String token);
  Future<void> deleteConversation(int conversationId, String token);
}
```

### 4. ViewModel State

```dart
class ChatbotState {
  final List<ChatMessage> messages;      // Local chat messages for display
  final int? currentConversationId;
  final bool isLoading;
  final bool isSending;
  final String? error;
  final ChatbotQuotaModel? quota;
  final List<ChatbotConversationModel> conversations;  // For history

  const ChatbotState({
    this.messages = const [],
    this.currentConversationId,
    this.isLoading = false,
    this.isSending = false,
    this.error,
    this.quota,
    this.conversations = const [],
  });

  bool get canSendMessage => quota != null && quota!.remaining > 0 && !isSending;
}
```

### 5. UI Components

**ChatbotScreen:**
- AppBar with title "WellBot" and history button
- Messages list (ScrollController for auto-scroll)
- Quota indicator at top
- Input field at bottom with send button
- Loading indicator when sending
- Error handling with snackbar

**Chat Bubble:**
- Different styles for user vs assistant
- User: right-aligned, primary color
- Assistant: left-aligned, grey background
- Show timestamp
- Animate new messages

**Chat Input:**
- TextField with hint "Tanya seputar kehamilan..."
- Send button (disabled when empty or sending)
- Max length validation

### 6. Update Existing Files

**app_router.dart:**
```dart
// Add import
import 'package:wellmom_app/features/chatbot/presentation/pages/chatbot_screen.dart';

// Add route constant
static const String chatbot = '/chatbot';

// Add case in generateRoute
case chatbot:
  return MaterialPageRoute(
    builder: (_) => const ChatbotScreen(),
    settings: settings,
  );
```

**konsul_screen.dart:**
- Update WellBot card onTap to navigate to chatbot:
```dart
onTap: () {
  Navigator.of(context).pushNamed(AppRouter.chatbot);
},
```

---

## UI Design Requirements

### Colors (from AppColors)
- Primary: AppColors.primaryBlue
- User bubble: AppColors.primaryBlue
- Assistant bubble: Colors.grey[100]
- Text: AppColors.textDark
- Timestamp: AppColors.textLight

### Chat Screen Layout
```
┌─────────────────────────────┐
│ ←  WellBot           📋     │  ← AppBar with history button
├─────────────────────────────┤
│ ┌─────────────────────────┐ │
│ │ Sisa quota: 9500/10000  │ │  ← Quota indicator (optional)
│ └─────────────────────────┘ │
├─────────────────────────────┤
│                             │
│ ┌───────────────────┐       │
│ │ Assistant message │       │  ← Left aligned, grey
│ └───────────────────┘       │
│                             │
│       ┌───────────────────┐ │
│       │   User message    │ │  ← Right aligned, blue
│       └───────────────────┘ │
│                             │
│ ┌───────────────────┐       │
│ │ Assistant reply   │       │
│ │ with longer text  │       │
│ │ that wraps...     │       │
│ └───────────────────┘       │
│                             │
├─────────────────────────────┤
│ ┌─────────────────────┐ 📤  │  ← Input field + send button
│ │ Tanya seputar...    │     │
│ └─────────────────────┘     │
└─────────────────────────────┘
```

### Welcome Message
When conversation is empty, show welcome message from assistant:
```
"Halo Bunda! 👋 Saya WellBot, asisten kesehatan kehamilan Anda. 

Saya siap membantu menjawab pertanyaan seputar:
• Gejala dan perubahan tubuh
• Nutrisi dan makanan
• Olahraga yang aman
• Tanda-tanda bahaya

Silakan tanyakan apa saja! 💕"
```

---

## Error Handling

### Error Messages (Indonesian)
```dart
const chatbotErrors = {
  'QUOTA_EXCEEDED': 'Batas penggunaan harian habis. Coba lagi besok ya, Bunda!',
  'RATE_LIMITED': 'Terlalu cepat, Bunda. Tunggu sebentar ya...',
  'NETWORK_ERROR': 'Koneksi bermasalah. Periksa internet Anda.',
  'SERVER_ERROR': 'Server sedang sibuk. Coba lagi nanti.',
  'UNAUTHORIZED': 'Sesi habis. Silakan login ulang.',
};
```

### Handle API Errors
```dart
on DioException catch (e) {
  if (e.response?.statusCode == 403) {
    // Check if quota exceeded
    final detail = e.response?.data['detail'];
    if (detail?.contains('quota') || detail?.contains('batas')) {
      throw ServerFailure(chatbotErrors['QUOTA_EXCEEDED']!);
    }
  } else if (e.response?.statusCode == 429) {
    throw ServerFailure(chatbotErrors['RATE_LIMITED']!);
  }
  // ... other cases
}
```

---

## Token Management

The app needs to send auth token with requests. Get token from auth state:

```dart
// In providers, get token from existing auth provider
final chatbotRemoteDataSourceProvider = Provider<ChatbotRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatbotRemoteDataSourceImpl(dio);
});

// When calling API, pass token
// Token should be stored after login - check how existing auth flow stores it
```

**Note:** Check how the existing login flow stores the token (likely SharedPreferences or secure storage). Use the same mechanism to retrieve the token for chatbot API calls.

---

## Step-by-Step Implementation

### Step 1: Create Models
Create Freezed models in `lib/features/chatbot/data/models/`:
- chatbot_message_model.dart
- chatbot_conversation_model.dart
- chatbot_send_response_model.dart
- chatbot_quota_model.dart
- chatbot_history_model.dart

Then run: `flutter pub run build_runner build`

### Step 2: Create DataSource
Create `lib/features/chatbot/data/datasources/chatbot_remote_datasource.dart`

### Step 3: Create ViewModel
Create `lib/features/chatbot/presentation/viewmodels/chatbot_view_model.dart`

### Step 4: Create Providers
Create `lib/features/chatbot/presentation/providers/chatbot_providers.dart`

### Step 5: Create Widgets
Create in `lib/features/chatbot/presentation/widgets/`:
- chat_bubble.dart
- chat_input.dart
- quota_indicator.dart (optional)

### Step 6: Create Screens
Create in `lib/features/chatbot/presentation/pages/`:
- chatbot_screen.dart
- chatbot_history_screen.dart (optional for MVP)

### Step 7: Update Router
Update `lib/core/routing/app_router.dart`

### Step 8: Update Konsul Screen
Update `lib/features/konsul/presentation/pages/konsul_screen.dart`

---

## Testing Checklist

After implementation, verify:
- [ ] Can navigate from Konsul to Chatbot screen
- [ ] Welcome message shows on empty conversation
- [ ] Can send message and receive response
- [ ] Messages display correctly (user right, assistant left)
- [ ] Loading indicator shows while waiting for response
- [ ] Error messages show in Indonesian
- [ ] Quota info displays and updates
- [ ] Can scroll through messages
- [ ] Input clears after sending
- [ ] Back button works correctly

---

## Dependencies

Make sure these are in pubspec.yaml (should already exist):
```yaml
dependencies:
  flutter_riverpod: ^2.x
  dio: ^5.x
  freezed_annotation: ^2.x
  json_annotation: ^4.x

dev_dependencies:
  build_runner: ^2.x
  freezed: ^2.x
  json_serializable: ^6.x
```

---

## Important Notes

1. **Deadline**: Innovillage 2025 - January 12th
2. **Priority**: Working MVP over perfect code
3. **Language**: All UI text in Bahasa Indonesia
4. **UX**: Keep it simple and friendly for pregnant mothers
5. **Token**: Make sure to handle auth token properly
