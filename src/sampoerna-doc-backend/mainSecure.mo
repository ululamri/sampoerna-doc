import DocumentSecure "documentSecure.mo";import DocumentSecure "documentSecure.mo";
import AccessControl "accessControl.mo";
import SessionManagement "sessionManagement.mo";
import AuditLog "auditLog.mo";

actor MainActorSecure {
    public shared func createDocument(title: Text, content: Text, sessionToken: Text, userKey: Text): async Text {
        let user = Principal.fromActor(this);
        if (await SessionManagement.validateSession(user, sessionToken)) {
            let result = await DocumentSecure.createDocument(title, content, user, userKey);
            await AuditLog.logAction(user, "Created document: " # title);
            return result;
        } else {
            return "Session validation failed";
        };
    };

    public shared func editDocument(title: Text, newContent: Text, sessionToken: Text, userKey: Text): async Text {
        let user = Principal.fromActor(this);
        if (await SessionManagement.validateSession(user, sessionToken)) {
            let result = await DocumentSecure.updateDocument(title, newContent, user, userKey);
            await AuditLog.logAction(user, "Edited document: " # title);
            return result;
        } else {
            return "Session validation failed";
        };
    };

    public shared func getDocument(title: Text, sessionToken: Text, userKey: Text): async ?Text {
        let user = Principal.fromActor(this);
        if (await SessionManagement.validateSession(user, sessionToken)) {
            let doc = await DocumentSecure.getDocument(title, user, userKey);
            await AuditLog.logAction(user, "Accessed document: " # title);
            return doc;
        } else {
            return null;
        };
    };

    public shared func endSession(): async Text {
        let user = Principal.fromActor(this);
        return await SessionManagement.endSession(user);
    };

    public shared func getAuditLogs(): async [(Time.Time, Principal, Text)] {
        return await AuditLog.getLogs();
    };
}
