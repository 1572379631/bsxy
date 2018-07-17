package cn.gzsxt.util;

import java.util.List;

public class PageUtil {
	//总共有多少条结果
	private int rowcount;
	//每页显示多少条数据
	private int pagesize = 10;
	//首页
	private int first =1;
	//尾页
	private int last;
	//当前的导航页
	private int currnav;
	//当前的起始页
	private int begin;
	//当前的结束页
	private int end;
	//上一页
	private int prev;
	//下一页
	private int next;
	//导航栏显示的个数
	private int navnum = 10;
	//总的导航栏个数
	private int navcount;
	//起始的行行数
	private int statrtrow = 1;

	//插叙的数据
	private List pageData;
	
	
	public int getStatrtrow() {
		return statrtrow;
	}

	public void setStatrtrow(int statrtrow) {
		this.statrtrow = statrtrow;
	}

	public PageUtil() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageUtil(int rowcount, int pagesize, int currnav, int navnum) {
		super();
		this.rowcount = rowcount;
		this.pagesize = pagesize;
		this.currnav = currnav;
		this.navnum = navnum;
		
		// 求出总的导航个数
				this.navcount = (int) Math.ceil(rowcount * 1.0 / pagesize);
				this.last = this.navcount;

				// 导航栏的第一个导航数
				this.begin = Math.max(1, (this.currnav - this.navnum / 2));
				this.end = Math.min(this.last, this.begin + this.navnum - 1);
				
				this.prev = Math.max(1, this.currnav - 1);
				this.next = Math.min(this.navcount, this.currnav + 1);
				
				this.statrtrow = (this.currnav - 1) * pagesize + 1;
				if(this.statrtrow<1){
					this.statrtrow = 1;
				}
				if ((this.last - this.begin) < (this.navnum - 1)) {
					this.begin = Math.max(this.first, this.end - this.navnum + 1);
				}
	}

	public int getRowcount() {
		return rowcount;
	}

	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getCurrnav() {
		return currnav;
	}

	public void setCurrnav(int currnav) {
		this.currnav = currnav;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getNavnum() {
		return navnum;
	}

	public void setNavnum(int navnum) {
		this.navnum = navnum;
	}

	public int getNavcount() {
		return navcount;
	}

	public void setNavcount(int navcount) {
		this.navcount = navcount;
	}

	public List getPageData() {
		return pageData;
	}

	public void setPageData(List pageData) {
		this.pageData = pageData;
	}
	
	
//	public static void main(String[] args) {
//		PageUtil pu = new PageUtil(760, 10, 10, 10);
//		System.out.println(pu.begin);
//		System.out.println(pu.end);
//	}
	
}
