package cn.gzsxt.pojo;

public class User {

	private Integer id;
	private String username;
	private Integer userage;
	private String  useradaress;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getUserage() {
		return userage;
	}
	public void setUserage(Integer userage) {
		this.userage = userage;
	}
	public String getUseradaress() {
		return useradaress;
	}
	public void setUseradaress(String useradaress) {
		this.useradaress = useradaress;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", userage=" + userage + ", useradaress=" + useradaress
				+ "]";
	}
	
	
}
