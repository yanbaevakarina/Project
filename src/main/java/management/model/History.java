package management.model;

public class History {
	private int id;
	private int idusers;
	private String product;
	private int price;

	public History (int id, int idusers,  String product, int price) {
		super();
		this.id = id;
		this.idusers = idusers;
		this.product = product;
		this.price = price;
	}
	
	public History (int idusers, String product, int price) {
		super();
		this.idusers = idusers;
		this.product = product;
		this.price = price;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getIdusers() {
		return idusers;
	}


	public void setIdusers(int idusers) {
		this.idusers = idusers;
	}

	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	
	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
}
