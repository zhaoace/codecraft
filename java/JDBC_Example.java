package packageOne;
import java.sql.*;

����/** *//**
����* ʹ��JDBC�������ݿ�MySQL�Ĺ���
����* DataBase��studentinfo�� table��student��
����* @author DuChangfeng 2008 09 18
����*/
public class DataBaseTest {

	public static Connection getConnection() throws SQLException,
	����java.lang.ClassNotFoundException
����{
����//��һ��������MySQL��JDBC������
����Class.forName("com.mysql.jdbc.Driver");
����//ȡ�����ӵ�url,�ܷ���MySQL���ݿ���û���,���룻studentinfo�����ݿ���
����String url = "jdbc:mysql://localhost:3306/studentinfo"; 
����String username = "root";
����String password = "admin";
����//�ڶ�����������MySQL���ݿ���������ʵ��
����Connection con = DriverManager.getConnection(url, username, password);
����return con;
����} 

	public static void main(String args[]) {
	try
	{
	����//����������ȡ������ʵ��con����con����Statement������ʵ�� sql_statement
	����Connection con = getConnection(); 
	����Statement sql_statement = con.createStatement();
	����/** *//************ �����ݿ������ز��� ************/
	����//���ͬ�����ݿ���ڣ�ɾ��
	����//sql_statement.executeUpdate("drop table if exists student");
	����//ִ����һ��sql���������һ����Ϊstudent�ı�
	����//sql_statement.executeUpdate("create table student (id int not null auto_increment, name varchar(20) not null default ��name��, math int not null default 60, primary key (id) ); ");
	����//����в�������
	����//sql_statement.executeUpdate("insert student values(1, ��liying��, 98)");
	����//sql_statement.executeUpdate("insert student values(2, ��jiangshan��, 88)");
	����//sql_statement.executeUpdate("insert student values(3, ��wangjiawu��, 78)");
	����//sql_statement.executeUpdate("insert student values(4, ��duchangfeng��, 100)");
	����//---���ϲ�����ʵ�ã������г�����Ϊ�ο�---
	����//���Ĳ���ִ�в�ѯ����ResultSet��Ķ��󣬷��ز�ѯ�Ľ��
	����String query = "select * from student";
	����ResultSet result = sql_statement.executeQuery(query);
	����/** *//************ �����ݿ������ز��� ************/
	����System.out.println("Student���е���������:");
	����System.out.println("------------------------");
	����System.out.println("ѧ��" + " " + "����" + " " + "���ݳɼ� ");
	����System.out.println("------------------------");
	����//�Ի�õĲ�ѯ������д�����Result��Ķ�����в���
	����while (result.next())
	����{
	��������int number = result.getInt("id");
	��������String name = result.getString("name");
	��������String mathScore = result.getString("math");
	��������//ȡ�����ݿ��е�����
	��������System.out.println(" " + number + " " + name + " " + mathScore);
	����}
	��������//�ر����Ӻ�����
	����sql_statement.close();
	����con.close();
	����} catch(java.lang.ClassNotFoundException e) {
	����//����JDBC����,��Ҫ�õ�����û���ҵ�
	����System.err.print("ClassNotFoundException");
	����//��������
	����System.err.println(e.getMessage());
	����} catch (SQLException ex) {
	����//��ʾ���ݿ����Ӵ�����ѯ����
	����System.err.println("SQLException: " + ex.getMessage());
	����} finally {
		 con.Close();
	   }
����}
}
