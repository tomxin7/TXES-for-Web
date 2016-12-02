package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class login_servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public login_servlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
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
		String name = request.getParameter("user_name");//接受用户名
		String password = request.getParameter("password");//接受密码
		String flag = "no";//返回的状态值
		System.out.println(name);
		System.out.println(password);	
		
		// 执行数据库的查询
		PreparedStatement ps=null;
		Connection conn=null;
		ResultSet rs=null;
		try {
			//加载驱动
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//创建连接
			conn=DriverManager.getConnection
			//前面是地址。中间是数据库，后面是账号密码。
			("jdbc:sqlserver://(你的IP):1433;DatabaseName=emailremind","数据库账号","密码");
			ps=conn.prepareStatement("select * from customer where name=? and password=?");
			ps.setString(1, name);//这里的1代表第一个问号，有多个？就多个数字，后面是变量
			ps.setString(2, password);
			rs=ps.executeQuery();
				while(rs.next()){
					flag="ok";
				}
			  // 完成后关闭
            rs.close();
            ps.close();
            conn.close();
			
		} catch (Exception e) {
			System.out.print(e.getMessage());	
		}
		
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		//创建一个返回
		System.out.print(flag);
		if(flag.equals("no")){
			response.sendRedirect("/txes/index.jsp?flag=no");
		}else if(flag.equals("ok")){
			request.getSession().setAttribute("name",name);
			response.sendRedirect("/txes/remind.jsp");
			//request.getRequestDispatcher( "/remind.jsp").forward(request,response);
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
