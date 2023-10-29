
sealed class UserSession {}

class Authorized extends UserSession {
  Authorized() : super();
}

class Unauthorized extends UserSession {
  Unauthorized() : super();
}
