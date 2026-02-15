package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("org.postgresql.Driver");

            con = DriverManager.getConnection(
                "jdbc:postgresql://ep-quiet-bird-aid5jfp3-pooler.c-4.us-east-1.aws.neon.tech/neondb?user=neondb_owner&password=npg_TQ9G3RZaAjfg&sslmode=require&channelBinding=require"
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}