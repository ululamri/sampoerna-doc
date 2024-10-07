module {
    import Principal "mo:base/Principal";

    stable var sessionTokens: [(Principal, Text)] = [];

    public func createSession(user: Principal): async Text {
        let token = Principal.toText(user) # "-token-" # Nat.toText(Time.now());
        sessionTokens := sessionTokens # [(user, token)];
        return token;
    };

    public func validateSession(user: Principal, token: Text): async Bool {
        let validSession = sessionTokens.filter(func ((u, t)) { u == user and t == token });
        return validSession.size() > 0;
    };

    public func endSession(user: Principal): async Text {
        sessionTokens := sessionTokens.filter(func ((u, _)) { u != user });
        return "Session ended";
    };
};
