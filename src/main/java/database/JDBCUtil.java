package database;

import java.sql.*;

import com.mysql.cj.jdbc.Driver;
public class JDBCUtil {
    public static Connection getConnection() {
        Connection c = null;
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            String url = "jdbc:mySQL://localhost:3306/blog";
            String username = "root";
            String password = "";
            c = DriverManager.getConnection(url, username, password);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }
    public static void closeConnection(Connection c) {
        try {
            if(c!=null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void printInfo(Connection c) {
        try {
            if(c!=null) {
                DatabaseMetaData mtdt = c.getMetaData();
                System.out.println(mtdt.getDatabaseProductName());
                System.out.println(mtdt.getDatabaseProductVersion());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) throws SQLException {
//        Connection c = getConnection();
//        if (c!=null){
//            System.out.println("connected");
//            String sql = "select * from users";
//            PreparedStatement st = c.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()){
//                System.out.println(rs.getString("username"));
//
//                System.out.println(rs.getString("password"));
//            }
//            System.out.println(rs);
//        }
//    }

}
