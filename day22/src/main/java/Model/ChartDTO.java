package Model;

public class ChartDTO { //week

	String day;
	String cate;
	int sum;
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public ChartDTO(String day, String cate, int sum) {
		super();
		this.day = day;
		this.cate = cate;
		this.sum = sum;
	}
public ChartDTO() {}

	@Override
	public String toString() {
		return "��¥ : " + this.day + "\nī�װ� : " + this.cate + "\n�Һ񰡰� : " + this.sum + "\n"; 
	}
}
