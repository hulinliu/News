package org.jbit.news.bean;

import java.util.ArrayList;
import java.util.List;

/*
 * ���� ʵ����
 * @author  
 */

public class News {
	
	private String nid;
	private String ntid;
	private String ntname;
	public String getNtname() {
		return ntname;
	}

	public void setNtname(String ntname) {
		this.ntname = ntname;
	}

	private String ntitle;
	private String nauthor;
	private String ncreatedate;
	private String npicpath;
	private String ncontent;
	private String nmodifydate;
	private String nsummary;
	private List comments = null;

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getNtid() {
		return ntid;
	}

	public void setNtid(String ntid) {
		this.ntid = ntid;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNauthor() {
		return nauthor;
	}

	public void setNauthor(String nauthor) {
		this.nauthor = nauthor;
	}

	public String getNcreatedate() {
		return ncreatedate;
	}

	public void setNcreatedate(String ncreatedate) {
		this.ncreatedate = ncreatedate;
	}

	public String getNpicpath() {
		return npicpath;
	}

	public void setNpicpath(String npicpath) {
		this.npicpath = npicpath;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNmodifydate() {
		return nmodifydate;
	}

	public void setNmodifydate(String nmodifydate) {
		this.nmodifydate = nmodifydate;
	}

	public String getNsummary() {
		return nsummary;
	}

	public void setNsummary(String nsummary) {
		this.nsummary = nsummary;
	}

	public List getComments() {
		return comments;
	}

	public void setComments(List comments) {
		this.comments = comments;
	}
}
