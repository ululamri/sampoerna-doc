module {
    import Principal "mo:base/Principal";
    import Time "mo:base/Time";

    stable var logs: [(Time.Time, Principal, Text)] = [];

    public func logAction(user: Principal, action: Text): async Text {
        let timestamp = Time.now();
        logs := logs # [(timestamp, user, action)];
        return "Action logged";
    };

    public func getLogs(): async [(Time.Time, Principal, Text)] {
        return logs;
    };
};
