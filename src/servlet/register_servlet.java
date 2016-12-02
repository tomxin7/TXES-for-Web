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

public class register_servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public register_servlet() {
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
		String flag = null;
		String regiter_name = request.getParameter("register_user_name");//接受注册用户名
		String regiter_password = request.getParameter("register_password");//接受注册密码
		PreparedStatement ps = null;
		Connection conn=null;
		try{
            //加载驱动
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //创建连接
            conn=DriverManager.getConnection
            //前面是地址。中间是数据库，后面是账号密码。
	    ("jdbc:sqlserver://(你的IP):1433;DatabaseName=emailremind","数据库账号","密码");
            ps=conn.prepareStatement("EXEC add_user ?,?");
            ps.setString(1, regiter_name);//这里的1代表第一个问号，有多个？就多个数字，后面是变量
            ps.setString(2, regiter_password);
            ps.executeQuery();
		}catch (Exception e) {
			String return_Str = e.getMessage();
			System.out.print(return_Str);
			flag=return_Str;
			//调用ps.executeQuery();的时候，肯定会报错，然后进入catch，并返回2个错误
			if(return_Str.equals("用户名已经存在，请更换注册或者找回密码")){
				flag = return_Str;
			}
			//这句话的意思就代表没有返回值，注册成功了
			if(return_Str.equals("该语句没有返回结果集。")){
				flag = "ok";
			}
		}finally{
			  // 完成后关闭
				try {
					ps.close();
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		//创建一个返回
		PrintWriter out = response.getWriter();
		
		System.out.print(flag);
		//判断用户名是否已经存在
		if(flag.equals("用户名已经存在，请更换注册或者找回密码")){
			response.sendRedirect("/txes/register.jsp?flag=already");
		}
		//成功注册，返回登录页面
		else if(flag.equals("ok")){
			response.sendRedirect("/txes/index.jsp?flag=ok");
		}
		else{
			response.sendRedirect("/txes/register.jsp?flag=error");
		}
}


	public void init() throws ServletException {
		// Put your code here
	}

}
