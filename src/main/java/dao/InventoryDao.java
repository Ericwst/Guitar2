package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.GuitarSpec;
import model.Inventory;
import tool.JDBConnection;

public class InventoryDao {
	public InventoryDao(){
		
	}
	
	public Inventory getAllGuitars() throws Exception{
		
		JDBConnection jdbc =  new JDBConnection();
		Connection connection = jdbc.connection;
		PreparedStatement ps = connection.prepareStatement("select * from guitar");
		Inventory inventory = new Inventory();
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){			
			inventory.addGuitar(rs.getString(1),rs.getDouble(2),rs.getString(3),rs.getInt(4), new GuitarSpec(rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
		}
		if(rs != null){
			rs.close();
		}
		ps.close();
		connection.close();

		return (Inventory) Inventory.getGuitars();
	}

}
