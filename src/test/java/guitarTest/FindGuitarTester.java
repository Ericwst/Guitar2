package guitarTest;

import java.util.Iterator;
import java.util.List;

import model.Guitar;
import model.GuitarSpec;
import model.Inventory;

public class FindGuitarTester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		Inventory inventory = new Inventory();
	    initializeInventory(inventory);

	    GuitarSpec whatErinLikes = 
	    	      new GuitarSpec("Fender", "Electric", "Alder", "Alder");
	    List matchingGuitars = inventory.search(whatErinLikes);
	    if (!matchingGuitars.isEmpty()) {
	      System.out.println("Erin, you might like these guitars:");
	      for (Iterator i = matchingGuitars.iterator(); i.hasNext(); ) {
	        Guitar guitar = (Guitar)i.next();
	        GuitarSpec spec = guitar.getSpec();
	        System.out.println("  We have a " +
	          spec.getBuilder() + " " + guitar.getModel() + " " +
	          spec.getType() + " guitar:\n     " +
	          spec.getBackWood() + " back and sides,\n     " +
	          spec.getTopWood() + " top.\n  You can have it for only $" +
	          guitar.getPrice() + "!\n  ----");
	      }
	    } else {
	      System.out.println("Sorry, Erin, we have nothing for you.");
	    }
	}
	
	private static void initializeInventory(Inventory inventory) {
	    inventory.addGuitar("11277", 3999.95, "CJ",  6,
	      new GuitarSpec("Collings", "Acoustic", "Indian_Rosewood", "Sitka"));
	    
	    inventory.addGuitar("V95693", 1499.95, "Stratocastor", 6,
	      new GuitarSpec("Fender", "Electric", "Alder", "Alder"));
	    
	    inventory.addGuitar("V9512", 1549.95,  "Stratocastor", 6,
	      new GuitarSpec("Fender", "Electric", "Alder", "Alder"));
	    
	    inventory.addGuitar("122784", 5495.95,  "D-18", 6,
	      new GuitarSpec("Martin", "Acoustic", "Mahogany", "Adirondack"));
	    
	    inventory.addGuitar("76531", 6295.95,  "OM-28", 6,
	      new GuitarSpec("Martin", "Acoustic", "Brazilian_Rosewood", "Adirondack"));
	    
	    inventory.addGuitar("70108276", 2295.95, "Les Paul", 6,
	      new GuitarSpec("Gibson", "Electric", "Mahogany", "Mahogany"));
	    
	    inventory.addGuitar("82765501", 1890.95, "SG '61 Reissue", 6, 
	      new GuitarSpec("Gibson", "Electric", "Mahogany", "Mahogany"));
	    
	    inventory.addGuitar("77023", 6275.95, "D-28", 6, 
	      new GuitarSpec("Martin", "Acoustic", "Brazilian_Rosewood", "Adirondack"));
	    
	    inventory.addGuitar("1092", 12995.95, "SJ", 12,
	      new GuitarSpec("Olson", "Acoustic", "Indian_Rosewood", "Cedar"));
	    
	    inventory.addGuitar("566-62", 8999.95, "Cathedral", 12, 
	      new GuitarSpec("Ryan", "Acoustic", "Cocobolo", "Cedar"));
	    
	    inventory.addGuitar("6 29584", 2100.95,  "Dave Navarro Signature", 6,
	      new GuitarSpec("Prs", "Electric", "Mahogany", "Maple"));
	  }

}
