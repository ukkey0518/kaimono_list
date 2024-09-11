import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaimono_list/src/features/authentication/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

/// A repository for authentication.
class AuthRepository {
  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  /// Creates a new user with the provided email and password.
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Signs in with the provided email and password.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Signs out the current user.
  Future<void> signOut() => _auth.signOut();

  /// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out).
  Stream<AppUser?> get authStateChanges {
    return _auth.authStateChanges().map(_convertUser);
  }

  /// Returns the current user.
  AppUser? get currentUser => _convertUser(_auth.currentUser);

  /// Returns whether the user is signed in.
  bool get isSignedIn => _auth.currentUser != null;

  /// Converts a [User] instance to an [AppUser] instance.
  AppUser? _convertUser(User? user) {
    if (user == null) {
      return null;
    }
    return AppUser(
      id: user.uid,
      email: user.email!,
      name: user.displayName,
    );
  }
}

@Riverpod(keepAlive: true, dependencies: [])
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(FirebaseAuth.instance);
}

@Riverpod(
  keepAlive: true,
  dependencies: [
    authRepository,
  ],
)
AppUser? currentUser(CurrentUserRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUser;
}

@Riverpod(
  keepAlive: true,
  dependencies: [
    authRepository,
  ],
)
Stream<AppUser?> authStateChangesStream(AuthStateChangesStreamRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
}
