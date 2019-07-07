package org.jdit.news.bl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.jbit.news.bean.Comment;
import org.jbit.news.bean.News;

public class CommentsManager {

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
	//添加评论
	public int addComment(List list){
		openConnection();
		String sql = "insert into commentinfo values(null,?,?,?,?,?)";
		int i = 0;
		try{			
				ps = con.prepareStatement(sql);
				ps.setObject(1,list.get(0));
				ps.setObject(2,list.get(1));
				ps.setObject(3,list.get(2));
				ps.setObject(4,list.get(3));
				ps.setObject(5,list.get(4));
				i = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return i;
	}
	//通过nid查找评论
	public List getCommentsByNid(String nid){
		openConnection();
		List list = new ArrayList();		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		String sql = "select * from commentinfo"
					+ " where cnid = "
					+ nid
					+ " order by cdate desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Comment comment = new Comment();
				comment.setCid(String.valueOf(rs.getInt("cid")));
				comment.setCnid(String.valueOf(rs.getInt("cnid")));
				comment.setCauthor(rs.getString("cauthor"));
				comment.setCip(rs.getString("cip"));
				comment.setCcontent(rs.getString("ccontent"));
				comment.setCdate(sdf.format(rs.getObject("cdate")));
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}		
		return list;
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
