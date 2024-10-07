module {
    stable var permissions: [(Text, Principal, Text)] = [];

    public func setPermission(docTitle: Text, user: Principal, permission: Text): async Text {
        permissions := permissions # [(docTitle, user, permission)];
        return "Permission set";
    };

    public func hasPermission(docTitle: Text, user: Principal, permission: Text): Bool {
        let perms = permissions.filter(func ((title, userPrincipal, perm)) {
            title == docTitle and userPrincipal == user and perm == permission;
        });
        return perms.size() > 0;
    };
};
