import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Token {
  String accessToken;
  int expiresIn;
  int refreshExpiresIn;
  String refreshToken;
  String tokenType;
  int notBeforePolicy;
  String sessionState;
  String scope;

  Token({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.notBeforePolicy,
    required this.sessionState,
    required this.scope,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'expiresIn': expiresIn,
      'refreshExpiresIn': refreshExpiresIn,
      'refreshToken': refreshToken,
      'tokenType': tokenType,
      'notBeforePolicy': notBeforePolicy,
      'sessionState': sessionState,
      'scope': scope,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      accessToken: map['access_token'] as String,
      expiresIn: map['expires_in'] as int,
      refreshExpiresIn: map['refresh_expires_in'] as int,
      refreshToken: map['refresh_token'] as String,
      tokenType: map['token_type'] as String,
      notBeforePolicy: map['not-before-policy'] as int,
      sessionState: map['session_state'] as String,
      scope: map['scope'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Token other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.expiresIn == expiresIn &&
        other.refreshExpiresIn == refreshExpiresIn &&
        other.refreshToken == refreshToken &&
        other.tokenType == tokenType &&
        other.notBeforePolicy == notBeforePolicy &&
        other.sessionState == sessionState &&
        other.scope == scope;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        expiresIn.hashCode ^
        refreshExpiresIn.hashCode ^
        refreshToken.hashCode ^
        tokenType.hashCode ^
        notBeforePolicy.hashCode ^
        sessionState.hashCode ^
        scope.hashCode;
  }

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, refreshToken: $refreshToken, tokenType: $tokenType, notBeforePolicy: $notBeforePolicy, sessionState: $sessionState, scope: $scope)';
  }
}
