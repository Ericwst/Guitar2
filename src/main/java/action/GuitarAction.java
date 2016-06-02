package action;

import java.io.IOException;
import java.sql.*;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Guitar;
import model.GuitarSpec;
import model.Inventory;
import tool.JDBConnection;

/**
 * Servlet implementation class GuitarPost
 */
@WebServlet("/GuitarAction")
public class GuitarAction extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    public GuitarAction() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String builder = request.getParameter("builder");
		String type = request.getParameter("type");
		String backwood = request.getParameter("backwood");
		String topwood = request.getParameter("topwood");
		

		GuitarSpec guitarspec = new GuitarSpec(builder,type,backwood,topwood);
		
		Inventory inventory = new Inventory();
		initializeInventory(inventory);
		
		List<Guitar> matchingGuitars = inventory.search(guitarspec);

		request.setAttribute("matchingGuitar", matchingGuitars);
		request.getRequestDispatcher("/indexResult.jsp").forward(request,response);
	}

	private static void initializeInventory(Inventory inventory){
		Connection connection = null;
		JDBConnection jdbc =  new JDBConnection();
		PreparedStatement ps = null;
		connection = jdbc.connection;
		
		try {
				ps = connection.prepareStatement("select * from guitar");
	
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){			
					inventory.addGuitar(rs.getString(1),rs.getDouble(2),rs.getString(3),rs.getInt(4), new GuitarSpec(rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
				}
				if(rs != null){
					rs.close();
				}
				if(ps != null){
					ps.close();
				}
				connection.close();
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
