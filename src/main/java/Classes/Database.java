package Classes;

import javax.validation.constraints.Null;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

public class Database {

    private static String url = "jdbc:postgresql:tdb";
    private static Properties props = new Properties();
    private static Connection conn;

    static {
        props.setProperty("user", "postgres");
        props.setProperty("password", "123");
        props.setProperty("charSet ", "UTF8");
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

    public static String getTimeString(long time) {
        int dif_min;
        String stringTime = "";
        dif_min = (int) (System.currentTimeMillis() - time) / 1000 / 60;
        //https://javatalks.ru/topics/39523
        if (dif_min == 0) stringTime = "только что";
        else if (dif_min > 0 && dif_min < 60) stringTime = dif_min + " мин. назад";
        else if (dif_min == 60) stringTime = "час назад";
        else if (dif_min > 60) stringTime = "более часа назад";

//        if (dif_min > 60) stringTime = (dif_min / 60) + " часов " + (dif_min % 60) + " минут назад";
//        else stringTime = (dif_min + " минут назад");
        return stringTime;
    }

    public static ArrayList<String> getActualAd() {
        ArrayList<String> result = new ArrayList<String>();
        String sql =
                "select account_id,nickname,cr_date,text,tags " +
                        "from bboard " +
                        "order by cr_date";
        try {

            ResultSet rs = getConn()
                    .createStatement()
                    .executeQuery(sql);
            while (rs.next()) {
                result.add(rs.getString(1));
                result.add(rs.getString(2));
                result.add(getTimeString(rs.getTimestamp(3).getTime()));
                result.add(rs.getString(4));
                result.add(rs.getString(5));
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void addNewAc(int accId, int duration, String text, String nickname) throws SQLException {
        String sql = "" +
                "INSERT INTO bboard (account_id,  duration, text, tags, nickname) " +
                "VALUES (" + accId + "," + duration + ",'" + text + "',NULL ,'" + nickname + "')" +
                "";
//        System.out.println("Sql: " + sql);
        getConn().createStatement().executeUpdate(sql);
    }

    public static void main(String[] args) throws SQLException {

        String sql =
                "select to_char(cr_date,'dd/mm/yyyy hh24:mi:ss'),cr_date,now() " +
                        "from bboard " +
                        "order by cr_date";

        ResultSet rs = getConn()
                .createStatement()
                .executeQuery(sql);
        while (rs.next()) {
            int rightNow = (int) System.currentTimeMillis();
            int dif_min = (int) (rightNow - rs.getTimestamp(2).getTime()) / 1000 / 60; //min
//            System.out.println(new Date(dif_min).getTime());
            if (dif_min > 60) {
                int hh = (int) (dif_min / 60);
                dif_min = (dif_min % 60);
                System.out.println(hh + " hh " + dif_min + "min");
            } else {
                System.out.println(dif_min + " минут назад");
            }

        }
    }
}
