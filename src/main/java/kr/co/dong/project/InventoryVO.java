package kr.co.dong.project;

public class InventoryVO {
	private String inventory_product_id;
	private int inventory_stock;
	private int inventory_sales;
	public String getInventory_product_id() {
		return inventory_product_id;
	}
	public void setInventory_product_id(String inventory_product_id) {
		this.inventory_product_id = inventory_product_id;
	}
	public int getInventory_stock() {
		return inventory_stock;
	}
	public void setInventory_stock(int inventory_stock) {
		this.inventory_stock = inventory_stock;
	}
	public int getInventory_sales() {
		return inventory_sales;
	}
	public void setInventory_sales(int inventory_sales) {
		this.inventory_sales = inventory_sales;
	}
	@Override
	public String toString() {
		return "InventoryVO [inventory_product_id=" + inventory_product_id + ", inventory_stock=" + inventory_stock
				+ ", inventory_sales=" + inventory_sales + "]";
	}
	
	
	
}
