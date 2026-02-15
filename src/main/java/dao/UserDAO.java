package dao;

import entity.User;
import util.DBConnection;

import java.sql.*;

public class UserDAO {

    public int register(User user) {

        String sql = "INSERT INTO users(name, state, email, password) VALUES(?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getState());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());

            return ps.executeUpdate();

        } catch (SQLException e) {

            if ("23505".equals(e.getSQLState())) {
                return -1;
            }

            e.printStackTrace();
        }

        return 0;
    }

    public User login(User user) {

        String sql = "SELECT name, email FROM users WHERE email=? AND password=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User loggedUser = new User();
                loggedUser.setName(rs.getString("name"));
                loggedUser.setEmail(rs.getString("email"));
                return loggedUser;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
