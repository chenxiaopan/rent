package com.cxp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.cxp.entity.House;
import com.cxp.entity.Street;
import com.cxp.entity.Users;
import com.cxp.service.HouseService;
import com.cxp.service.StreetsService;
import com.cxp.service.UsersService;
import com.cxp.service.impl.HouseServiceImpl;
import com.cxp.service.impl.StreetsServiceImpl;
import com.cxp.service.impl.UsersServiceImpl;
import com.cxp.util.Page;

/**
 * Controller继承了javax.servlet.http.HttpServlet类
 * 它的doGet和doPost方法都调用process方法，这是Servlet控制器的核心
 * 
 * @author cxp
 * @date 2016-11-05
 * 
 */

public class ControllerServlet extends HttpServlet {

	/**
	 * 
	 */

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		process(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		process(request, response);

	}

	private void process(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		/**
		 * 完整的uri应该是：/app10a/product 但事件中有默认的应用程序名，所以应用名可以为空:/product
		 */

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		// 执行动作
		if (action.equals("ajaxStreet.do")) {

			StreetsService streetsService = new StreetsServiceImpl();
			request.setCharacterEncoding("utf-8");
			String did = request.getParameter("id");
			List<Street> list = streetsService.strList(Integer.parseInt(did));
			// 过滤不需要转换为json的字段，不过滤会引起死循环
			JsonConfig jsonConfig = new JsonConfig(); // 建立配置文件
			jsonConfig.setIgnoreDefaultExcludes(false); // 设置默认忽略
			jsonConfig.setExcludes(new String[] { "district", "houses" }); // 此处是亮点，只要将所需忽略字段加到数组中即可
			// 将list封装成json数组
			JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
			// 处理中文乱码
			response.setHeader("content-type", "text/html;charset=UTF-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.println(jsonArray);

		} else if (action.equals("doLogin.do")) {

			// 获得请求参数
			String name = request.getParameter("name");
			String pwd = request.getParameter("password");
			HttpSession session = request.getSession();
			if (session.getAttribute("name") != null
					&& session.getAttribute("name").equals(name)) {
				System.out.println("login" + session.getAttribute("name")
						+ "----" + name);
				response.sendRedirect("guanli.do");
			} else {
				UsersServiceImpl userImpl = new UsersServiceImpl();
				Users user = new Users(name, pwd);
				int count = userImpl.login(user);
				System.out.println(count);
				if (count > 0) {
					// 设置会话属性
					session.setAttribute("name", name);
					session.setMaxInactiveInterval(60 * 30);// 设置会话过期时长为30分钟
					// 不写斜杠表示相对路径
					response.sendRedirect("guanli.do");
				} else {
					request.setAttribute("errmsg", "登录失败！请重新登录。");
					// 返回登录页
					request.getRequestDispatcher("login.jsp").forward(request,
							response);

				}
			}

		} else if (action.equals("doRegs.do")) {
			/*
			 * // 获得表单参数 String name = request.getParameter("name"); String
			 * password = request.getParameter("password"); String telephone =
			 * request.getParameter("telephone"); String username =
			 * request.getParameter("username"); // 封装对象 Users user = new
			 * Users(name, password, telephone, username); UsersServiceImpl
			 * userImpl = new UsersServiceImpl(); int count =
			 * userImpl.add(user);
			 * 
			 * 
			 * // 处理中文乱码，一定要写在获得PrintWriter前
			 * response.setHeader("content-type","text/html;charset=UTF-8");
			 * response.setCharacterEncoding("UTF-8"); PrintWriter
			 * out=response.getWriter();
			 * 
			 * 
			 * if (count > 0) {
			 * request.getRequestDispatcher("doRegs.jsp").forward(request,
			 * response); }
			 */
		} else if (action.equals("addHouse.do")) {
			// 获取表单参数
			String title = request.getParameter("title");
			String type_id = request.getParameter("type_id");
			String floorage = request.getParameter("floorage");
			String price = request.getParameter("price");
			String houseDate = request.getParameter("houseDate"); // 完全没用，数据库中没有houseDate
			String district_id = request.getParameter("district_id");
			String street_id = request.getParameter("street_id");
			String contact = request.getParameter("contact");
			String description = request.getParameter("description");
			HttpSession session = request.getSession();
			// 根据用户名查找用户id
			int userId = 0;
			if (session.getAttribute("name") != null) {
				String name = (String) session.getAttribute("name"); // 根据用户名查找用户id
				UsersService usersService = new UsersServiceImpl();
				userId = usersService.findByName(name);
				System.out.println("userId---->" + userId);
			}

			// 构造房屋对象
			House house = new House(userId, title, description,
					Integer.parseInt(price), new Date(),
					Integer.parseInt(floorage), contact);

			house.getTypes().setId(new Short(type_id));
			house.getStreet().setId(new Short(street_id));
			house.getStreet().getDistrict().setId(new Short(district_id));

			// 实例化业务对象
			HouseService houseService = new HouseServiceImpl();
			// 添加进数据库
			houseService.add(house);
			// !必须得登录才能添加数据，否则会提示违反完整性约束
			response.sendRedirect("/rent1213hib/page/guanli.do");

		} else if (action.equals("details.do")) {
			// 实例化服务对象
			HouseService houseService = new HouseServiceImpl();
			// 获得请求参数
			String title = request.getParameter("title");
			// 调用方法
			House house = houseService.findByTitle(title);
			// 保存数据在请求域
			request.setAttribute("house", house);
			// 请求分派
			request.getRequestDispatcher("/page/details.jsp").forward(request,
					response);

		} else if (action.equals("listPage.do")) {
			// 1.实例化业务对象
			HouseServiceImpl pService = new HouseServiceImpl();

			// 2.设置当前页
			int pageIndex = 1;
			String str = request.getParameter("pageIndex");
			pageIndex = (str == null) ? (1) : (Integer.parseInt(str));
			// 3.每页显示的个数
			int pageSize = 5;
			// 4.创建分页对象
			Page page = new Page(pageSize, pageIndex);

			// 5.调用方法
			List<House> houseList = pService.getPageInfo(page);
			// 8.保存数据在请求域
			request.setAttribute("houseList", houseList);
			request.setAttribute("page", page);

			request.getRequestDispatcher("/page/listPage.jsp").forward(request,
					response);
		} else if (action.equals("guanli.do")) {

			// 1.实例化业务对象
			HouseServiceImpl pService = new HouseServiceImpl();

			// 2.设置当前页
			int pageIndex = 1;
			String str = request.getParameter("pageIndex");
			pageIndex = (str == null) ? (1) : (Integer.parseInt(str));
			// 3.每页显示的个数
			int pageSize = 5;
			// 4.创建分页对象
			Page page = new Page(pageSize, pageIndex);

			// 5.调用方法
			List<House> houseList = pService.getPageInfo(page);
			// 8.保存数据在请求域
			request.setAttribute("houseList", houseList);
			request.setAttribute("page", page);

			request.getRequestDispatcher("/page/guanli.jsp").forward(request,
					response);
		} else if (action.equals("searchHouse.do")) {
			// 获得请求参数
			String title = request.getParameter("title");
			String price = request.getParameter("price");
			System.out.println("price--->"+price);
			String street = request.getParameter("street");
			String type = request.getParameter("type");
//			String floorage = request.getParameter("floorage");

			House house = new House();
			house.setTitle(""+title);
			house.getStreet().setName(""+street);
			house.getTypes().setName(""+type);
//			house.setFloorage(Integer.parseInt(floorage));

			// 实例化业务对象
			HouseService houseService = new HouseServiceImpl();

			String[] prices=price.split("-");
			
			System.out.println("low:"+prices[0]+" high:"+prices[1]);
			
			// 查询
			List<House> houseList = houseService.list(house,Integer.parseInt(prices[0]),Integer.parseInt(prices[1]));

			// 保存数据在请求域
			request.setAttribute("houseList", houseList);
			System.out.println("house----->"+house.getStreet().getName()+"title"+house.getTitle());
			request.setAttribute("house", house);
			request.setAttribute("prices", prices);
			request.getRequestDispatcher("/page/listPage.jsp").forward(request,
					response);
		}
	}
}