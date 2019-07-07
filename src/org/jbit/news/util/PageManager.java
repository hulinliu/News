package org.jbit.news.util;

import java.util.ArrayList;
import java.util.List;

public class PageManager {

	//��ǰҳ���
	private int page_no = 0;
	//��ҳ��ʾ��Ϣ��Ŀ
	private int page_info_no = 0;
	//��ҳ��
	private int total_page = 0;
	//����Ϣ��
	private int total_info = 0;
	//��ȡ�������з�ҳsql
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
	//��ȡ����һ����ҳsql
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
	//���㲢������ҳ��
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
