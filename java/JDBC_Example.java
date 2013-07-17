package packageOne;
import java.sql.*;

　　/** *//**
　　* 使用JDBC连接数据库MySQL的过程
　　* DataBase：studentinfo， table：student；
　　* @author DuChangfeng 2008 09 18
　　*/
public class DataBaseTest {

	public static Connection getConnection() throws SQLException,
	　　java.lang.ClassNotFoundException
　　{
　　//第一步：加载MySQL的JDBC的驱动
　　Class.forName("com.mysql.jdbc.Driver");
　　//取得连接的url,能访问MySQL数据库的用户名,密码；studentinfo：数据库名
　　String url = "jdbc:mysql://localhost:3306/studentinfo"; 
　　String username = "root";
　　String password = "admin";
　　//第二步：创建与MySQL数据库的连接类的实例
　　Connection con = DriverManager.getConnection(url, username, password);
　　return con;
　　} 

	public static void main(String args[]) {
	try
	{
	　　//第三步：获取连接类实例con，用con创建Statement对象类实例 sql_statement
	　　Connection con = getConnection(); 
	　　Statement sql_statement = con.createStatement();
	　　/** *//************ 对数据库进行相关操作 ************/
	　　//如果同名数据库存在，删除
	　　//sql_statement.executeUpdate("drop table if exists student");
	　　//执行了一个sql语句生成了一个名为student的表
	　　//sql_statement.executeUpdate("create table student (id int not null auto_increment, name varchar(20) not null default ’name’, math int not null default 60, primary key (id) ); ");
	　　//向表中插入数据
	　　//sql_statement.executeUpdate("insert student values(1, ’liying’, 98)");
	　　//sql_statement.executeUpdate("insert student values(2, ’jiangshan’, 88)");
	　　//sql_statement.executeUpdate("insert student values(3, ’wangjiawu’, 78)");
	　　//sql_statement.executeUpdate("insert student values(4, ’duchangfeng’, 100)");
	　　//---以上操作不实用，但是列出来作为参考---
	　　//第四步：执行查询，用ResultSet类的对象，返回查询的结果
	　　String query = "select * from student";
	　　ResultSet result = sql_statement.executeQuery(query);
	　　/** *//************ 对数据库进行相关操作 ************/
	　　System.out.println("Student表中的数据如下:");
	　　System.out.println("------------------------");
	　　System.out.println("学号" + " " + "姓名" + " " + "数据成绩 ");
	　　System.out.println("------------------------");
	　　//对获得的查询结果进行处理，对Result类的对象进行操作
	　　while (result.next())
	　　{
	　　　　int number = result.getInt("id");
	　　　　String name = result.getString("name");
	　　　　String mathScore = result.getString("math");
	　　　　//取得数据库中的数据
	　　　　System.out.println(" " + number + " " + name + " " + mathScore);
	　　}
	　　　　//关闭连接和声明
	　　sql_statement.close();
	　　con.close();
	　　} catch(java.lang.ClassNotFoundException e) {
	　　//加载JDBC错误,所要用的驱动没有找到
	　　System.err.print("ClassNotFoundException");
	　　//其他错误
	　　System.err.println(e.getMessage());
	　　} catch (SQLException ex) {
	　　//显示数据库连接错误或查询错误
	　　System.err.println("SQLException: " + ex.getMessage());
	　　} finally {
		 con.Close();
	   }
　　}
}
