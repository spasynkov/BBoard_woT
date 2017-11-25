package Classes;

import javax.validation.constraints.Null;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class Database {

    private static String url = "jdbc:postgresql:tdb";
    private static Properties props = new Properties();
    private static Connection conn;

    static {
        initConn();
    }

    public static boolean initConn() {
        props.setProperty("user", "postgres");
        props.setProperty("password", "123");
        try {
            if (conn == null || conn.isClosed())
                conn = DriverManager.getConnection(url, props);

        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    public static Connection getConn() throws SQLException {
        if (conn == null || conn.isClosed()) //перестраховка
            initConn();
        return conn;
    }

    public static ArrayList<String> getActualAd() {
        ArrayList<String> result = new ArrayList<String>();
        String sql =
                "select nickname,to_char(cr_date,'dd/mm/yyyy hh24:mi:ss'),text,tags " +
                        "from bboard " +
                        "order by cr_date";
        try {

            ResultSet rs = getConn()
                    .createStatement()
                    .executeQuery(sql);
            while (rs.next()) {
                result.add(rs.getString(1));
                result.add(rs.getString(2));
                result.add(rs.getString(3));
                result.add(rs.getString(4));
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e1){
            e1.printStackTrace();
        }
        return result;
    }


    public static void main(String[] args) throws SQLException {
        for (String s : getActualAd()) {
            System.out.println(s);
        }
    }
}
