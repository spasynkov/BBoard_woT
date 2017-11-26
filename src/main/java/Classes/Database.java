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
        props.setProperty("user", "postgres");
        props.setProperty("password", "123");
        props.setProperty("charSet ","UTF8");
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        initConn();
    }

    public static boolean initConn() {

        try {
            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection(url, props);
            }
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
        } catch (NullPointerException e1) {
            e1.printStackTrace();
        }
        return result;
    }

    public static void addNewAc(int accId, int duration, String text, String nickname) throws SQLException{
        String sql = "" +
                "INSERT INTO bboard (account_id,  duration, text, tags, nickname) " +
                "VALUES ("+accId+","+duration+",'"+text+"',NULL ,'"+nickname+"')" +
                "";
        System.out.println("Sql: "+sql);
        getConn().createStatement().executeUpdate(sql);
    }

//    public static void main(String[] args) throws SQLException {
//
//    }
}
