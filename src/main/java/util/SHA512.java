package util;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;

public class SHA512 {
    public static String hash(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            byte[] passwordBytes = password.getBytes(StandardCharsets.UTF_8);
            byte[] digest = md.digest(passwordBytes);
            StringBuilder hexString = new StringBuilder();
            for (byte b : digest) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
