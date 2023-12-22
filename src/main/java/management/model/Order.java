package management.model;

public class Order {
	private int id;
	private int iduser;
	private int sum;

	
	public Order (int id, int iduser, int sum) {
		super();
		this.id = id;
		this.iduser = iduser;
		this.sum = sum;
	}
	
	
	public Order(int iduser, int sum) {
		super();
		this.iduser = iduser;
		this.sum = sum;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public int getIduser() {
		return iduser;
	}


	public void setIduser(int iduser) {
		this.iduser = iduser;
	}


	public int getSum() {
		return sum;
	}


	public void setSum(int sum) {
		this.sum = sum;
	}

}
