package org.jdit.news.bl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.jbit.news.bean.News;

public class NewsManager {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	//通过JNDI获取数据库连接
	private void openConnection(){
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/newsDS");
			con = ds.getConnection();			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	//获取所有新闻
	public List getAllnews(){
		List list = new ArrayList();
		openConnection();
		String sql = "select *"
			+ " from news,topic"
			+ " where news.ntid = topic.tid"
			+ " order by ntid,ncreatedate desc";
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		try{			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			while(rs.next()){
				Map news = new HashMap();
				news.put("nid", String.valueOf(rs.getObject("nid")));
				news.put("ntid", String.valueOf(rs.getObject("ntid")));
				news.put("ntitle", rs.getString("ntitle"));
				news.put("nauthor", rs.getString("nauthor"));
				news.put("tname", rs.getString("tname"));
				news.put("ncontent", rs.getString("ncontent"));
				news.put("ncreatedate", rs.getString("ncreatedate"));
				news.put("npicpath", rs.getString("npicpath"));				
				news.put("nsummary", rs.getString("nsummary"));				
				list.add(news);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return list;
	}
	//使用分页获取所有新闻
	public List getAllnewsByPage(int page_info_no, int page_no){
		List list = new ArrayList();
		openConnection();
		// for MySQL
		String sql = "select *"
		+ " from news,topic "
		+ " where news.ntid=topic.tid order by ncreatedate desc limit "
		+ ((page_no-1) * page_info_no)+","+page_info_no; 
		/* ---用于MSSQL，Oracle不支持select top
		String sql = "select top " + page_info_no +" *"
					+ " from news,topic "
					+ " where news.ntid=topic.tid and nid not in"
					+ " (select top " + ((page_no-1) * page_info_no)
						+ " nid from news,topic " 
						+ "where news.ntid=topic.tid order by ncreatedate desc)"
					+ " order by ncreatedate desc";   */
		/* 用于Oracle，MySQL不支持rownum伪列
		String sql = "select * from (select rownum as r, t.* from ("+
		"select * from news,topic where news.ntid=topic.tid order by ncreatedate desc) t"+
		" where rownum<="+page_no*page_info_no+") s where s.r>"+((page_no-1) * page_info_no);*/

		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		try{			
			Statement s = con.createStatement();
			rs = s.executeQuery(sql);	
			while(rs.next()){
				Map news = new HashMap();
				news.put("nid", String.valueOf(rs.getObject("nid")));
				news.put("ntid", String.valueOf(rs.getObject("ntid")));
				news.put("ntitle", rs.getString("ntitle"));
				news.put("nauthor", rs.getString("nauthor"));
				news.put("tname", rs.getString("tname"));
				news.put("ncontent", rs.getString("ncontent"));
				news.put("ncreatedate", rs.getString("ncreatedate"));
				news.put("npicpath", rs.getString("npicpath"));				
				news.put("nsummary", rs.getString("nsummary"));				
				list.add(news);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return list;
	}
	//使用分页获取某一主题下的所有新闻
	public List getAllnewsByPageAndTid(int page_info_no, int page_no, String tid){
		List list = new ArrayList();
		openConnection();
		// for MySQL
		String sql = "select *"
		+ " from news,topic "
		+ " where news.ntid=topic.tid and topic.tid="+tid+" order by ncreatedate desc limit "
		+ ((page_no-1) * page_info_no)+","+page_info_no; 
	    /* for MSSQL
	    String sql = "select top " + page_info_no +" *"
					+ " from news,topic "
					+ " where news.ntid=topic.tid and topic.tid = " + tid 
					+ " and nid not in"
					+ " (select top " + ((page_no-1) * page_info_no)
						+ " nid from news" 
						+ " where news.ntid=topic.tid and topic.tid = " + tid
						+ " order by ncreatedate desc)"
					+ " order by ncreatedate desc";  */
	   /* for Oracle
		String sql = "select * from (select rownum as r, t.* from ("+
		"select * from news,topic where news.ntid=topic.tid and topic.tid="+tid+" order by ncreatedate desc) t"+
		" where rownum<="+page_no*page_info_no+") s where s.r>"+((page_no-1) * page_info_no);
		*/
		System.out.println(sql);
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		try{			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			while(rs.next()){
				Map news = new HashMap();
				news.put("nid", String.valueOf(rs.getObject("nid")));
				news.put("ntid", String.valueOf(rs.getObject("ntid")));
				news.put("ntitle", rs.getString("ntitle"));
				news.put("nauthor", rs.getString("nauthor"));
				news.put("tname", rs.getString("tname"));
				news.put("ncontent", rs.getString("ncontent"));
				news.put("ncreatedate", rs.getString("ncreatedate"));
				news.put("npicpath", rs.getString("npicpath"));				
				news.put("nsummary", rs.getString("nsummary"));				
				list.add(news);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return list;
	}
	//获取新闻总数
	public int countNews(){
		int count = 0;
		String sql = "select count(*)  from news";
		openConnection();
		try{			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			while(rs.next()){
				count = rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return count;
	}
	//获取指定新闻
	public Map getNewsByNid(String nid){
		List list = new ArrayList();
		Map news = null;
		openConnection();
		String sql = "select *"
			+ " from news,topic"
			+ " where news.ntid = topic.tid and nid = "
			+ nid;
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		try{			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();			
			while(rs.next()){
				news = new HashMap();
				news.put("nid", String.valueOf(rs.getObject("nid")));
				news.put("ntid", String.valueOf(rs.getObject("ntid")));
				news.put("ntitle", rs.getString("ntitle"));
				news.put("nauthor", rs.getString("nauthor"));
				news.put("tname", rs.getString("tname"));
				news.put("ncontent", rs.getString("ncontent"));
				news.put("ncreatedate", rs.getString("ncreatedate"));
				news.put("npicpath", rs.getString("npicpath"));
				news.put("nsummary", rs.getString("nsummary"));				
				list.add(news);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return news;
	}
	//获取指定主题下的新闻
	public List getNewByTid(String tid){
		List list = new ArrayList();
		openConnection();
		String sql = "select *"
			+ " from news,topic"
			+ " where news.ntid = topic.tid and topic.tid = "
			+ tid
			+ " order by ncreatedate desc";
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		try{			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			while(rs.next()){
				Map news = new HashMap();
				news.put("nid", String.valueOf(rs.getObject("nid")));
				news.put("ntid", String.valueOf(rs.getObject("ntid")));
				news.put("ntitle", rs.getString("ntitle"));
				news.put("nauthor", rs.getString("nauthor"));
				news.put("tname", rs.getString("tname"));
				news.put("ncontent", rs.getString("ncontent"));
				news.put("ncreatedate", rs.getObject("ncreatedate"));
				news.put("npicpath", rs.getString("npicpath"));
				news.put("nsummary", rs.getString("nsummary"));				
				list.add(news);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return list;
	}
	//获取所有主题
	public List getAllTopics(){
		List list = new ArrayList();
		openConnection();
		String sql = "select * from topic";
		try{			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			while(rs.next()){
				Map topic = new HashMap();
				topic.put("tid", rs.getString("tid"));
				topic.put("tname", rs.getString("tname"));								
				list.add(topic);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return list;
	}
	
	//根据nid删除一条新闻
	public int deleteNewsByNid(String nid){
		int res=0;
		openConnection();
		String sql = "delete from news where nid=?";
		try{
			ps=con.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(nid));
			res= ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return res;
	}
	
	//添加一条新闻
	public int insertNews(News n){
		int res=0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		openConnection();
		String sql = "insert into news values (null,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(n.getNtid()));
			ps.setString(2,n.getNtitle());
			ps.setString(3,n.getNauthor());
			ps.setString(4,n.getNcreatedate());//会报错
			ps.setString(5,n.getNpicpath());
			ps.setString(6,n.getNcontent());
			ps.setString(7,n.getNmodifydate());
			ps.setString(8,n.getNsummary());
			res= ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeResource();
		}				
		return res;
	}

	//修改新闻信息
	public int updateNewsByNid(String nid,News n){
		int res=0;
		openConnection();
		String sql = "update news set ntid=?,ntitle=?,nauthor=?,npicpath=?,ncontent=?,nmodifydate=?,nsummary=? "
			        +"where nid=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(n.getNtid()));
			ps.setString(2,n.getNtitle());
			ps.setString(3,n.getNauthor());
			ps.setString(4,n.getNpicpath());
			ps.setString(5,n.getNcontent());
			ps.setString(6,n.getNmodifydate());
			ps.setString(7,n.getNsummary());
			ps.setInt(8,Integer.parseInt(nid));
			res= ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeResource();
		}				
		return res;
	}
	
	//释放资源
	private boolean closeResource(){
		try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
				if(con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		return true;
	}
}
