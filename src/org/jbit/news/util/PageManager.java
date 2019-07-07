package org.jbit.news.util;

import java.util.ArrayList;
import java.util.List;

public class PageManager {

	//当前页编号
	private int page_no = 0;
	//单页显示信息数目
	private int page_info_no = 0;
	//总页数
	private int total_page = 0;
	//总信息数
	private int total_info = 0;
	//获取单表所有分页sql
	public List<String> getSqls(String className, String key, String orderBy){
		List<String> list = new ArrayList<String>();
		total_page = countTotalPage();
		String sql = null;
		for(page_no = 1; page_no <= total_page; page_no++){
			sql = "select top " + page_info_no +" *"
			+ " from " + className.toLowerCase()
			+ " where " + key + " not in"
			+ " (select top " + ((page_no-1) * page_info_no) + " " + key 
				+ " from " + className.toLowerCase() + ")"
			+ " order by " + orderBy;
			list.add(sql);
		}
		return list;
	}
	//获取单表一个分页sql
	public String getSql(String className, String key, String orderBy){
		total_page = countTotalPage();
		String sql = null;
		sql = "select top " + page_info_no +" *"
		+ " from " + className.toLowerCase()
		+ " where " + key + " not in"
		+ " (select top " + ((page_no-1) * page_info_no) + " " + key 
			+ " from " + className.toLowerCase() + ")"
		+ " order by " + orderBy;

		return sql;
	}
	//计算并返回总页数
	private int countTotalPage(){
		this.total_page = total_info/page_info_no + 1;
		return total_page;
	}
	
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	public int getPage_info_no() {
		return page_info_no;
	}
	public void setPage_info_no(int page_info_no) {
		this.page_info_no = page_info_no;
	}
	public int getTotal_page() {
		return total_page;
	}
	public int getTotal_info() {
		return total_info;
	}
	public void setTotal_info(int total_info) {
		this.total_info = total_info;
	}
}
