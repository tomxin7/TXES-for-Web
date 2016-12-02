package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class remind_servlet extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public remind_servlet() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取到用户的账户密码
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				String flag = null;
				//接受用户名
				String add_name = request.getParameter("remind_name");
				//接受提醒类型
				String add_type = request.getParameter("remind_type");
				//接受提醒标题
				String add_title = request.getParameter("remind_title");
				//接受提醒的日期
				String add_date = request.getParameter("remind_date");
				//接受提醒时间
				String add_time = request.getParameter("remind_time");
				//接受提醒内容
				String add_conten = request.getParameter("remind_content");
				String mail_content = request.getParameter("mail_content");//接受提醒邮箱			
				String mail_pyte = request.getParameter("mail_pyte");//接受提醒邮箱
				String add_mail = mail_content+mail_pyte;
				PrintWriter out = response.getWriter();
				String year = add_date.substring(0,4);
				String month = add_date.substring(5,7);
				String day = add_date.substring(8,10);
				add_time=year+"/"+month+"/"+day +" " + add_time + ":00";
				System.out.println(add_name);
				PreparedStatement ps = null;
				Connection conn=null;
				try{
		            //加载驱动
		            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		            //创建连接
		            conn=DriverManager.getConnection
		            //前面是地址。中间是数据库，后面是账号密码。
		            ("jdbc:sqlserver://(你的IP):1433;DatabaseName=emailremind","数据库账号","密码");
		            ps=conn.prepareStatement("EXEC add_remind ?,?,?,?,?,?,?");
		            //ps=conn.prepareStatement("EXEC add_remind 'tomxin','456','起床看书咯','要考试啦','2016/8/26 12:05:15' ,'865498311@163.com','no'");
		            ps.setString(1, add_name);//这里的1代表第一个问号，有多个？就多个数字，后面是变量
		            ps.setString(2, add_type);
		            ps.setString(3, add_title);
		            ps.setString(4, add_conten);
		            ps.setString(5, add_time);
		            ps.setString(6, add_mail);
		            ps.setString(7, "no");
		            ps.executeQuery();
				}catch (Exception e) {
					String return_Str = e.getMessage();
					if(return_Str.equals("该语句没有返回结果集。")){
						return_Str = "提醒已经添加成功";
					}
					flag=return_Str;
				}finally{
					  // 完成后关闭
						try {
							ps.close();
							ps.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
				}
			
				System.out.print(flag);
				if(flag.equals("提醒已经添加成功")){
					response.sendRedirect("/txes/remind.jsp?flag=ok");
				}
}


	public void init() throws ServletException {
		// Put your code here
	}

}
