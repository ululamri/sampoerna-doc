module {
    import AccessControl "accessControl.mo";
    import e2eEncryption "e2eEncryption.mo";
    import Principal "mo:base/Principal";
    import Blob "mo:base/Blob";

    stable var documents: [(Text, Blob)] = [];

    public func createDocument(title: Text, content: Text, user: Principal, userKey: Text): async Text {
        if (AccessControl.hasPermission(title, user, "edit")) {
            let encryptedContent = await e2eEncryption.encrypt(content, userKey);
            documents := documents # [(title, encryptedContent)];
            return "Document created and encrypted";
        } else {
            return "Access Denied";
        };
    };

    public func getDocument(title: Text, user: Principal, userKey: Text): async ?Text {
        if (AccessControl.hasPermission(title, user, "view")) {
            let doc = documents.filter(func ((docTitle, _)) { docTitle == title });
            switch (doc) {
                case [(title, encryptedContent)] return await e2eEncryption.decrypt(encryptedContent, userKey);
                case [] return null;
            };
        } else {
            return null;
        };
    };

    public func updateDocument(title: Text, newContent: Text, user: Principal, userKey: Text): async Text {
        if (AccessControl.hasPermission(title, user, "edit")) {
            let encryptedContent = await e2eEncryption.encrypt(newContent, userKey);
            documents := documents.filter(func ((docTitle, _)) { docTitle != title });
            documents := documents # [(title, encryptedContent)];
            return "Document updated and encrypted";
        } else {
            return "Access Denied";
        };
    };
};
