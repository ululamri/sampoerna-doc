module {
    import Principal "mo:base/Principal";
    import Blob "mo:base/Blob";
    import Debug "mo:base/Debug";

    public func encrypt(content: Text, userKey: Text): async Blob {
        let encrypted = Blob.toBytes(Text.encodeUtf8(content));
        Debug.print("Encrypting content with key: " # userKey);
        return Blob.fromArray(encrypted);
    };

    public func decrypt(encryptedContent: Blob, userKey: Text): async ?Text {
        let decrypted = Text.decodeUtf8(Blob.toArray(encryptedContent));
        Debug.print("Decrypting content with key: " # userKey);
        return ?decrypted;
    };
};
