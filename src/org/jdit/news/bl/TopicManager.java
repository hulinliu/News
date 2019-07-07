package org.jdit.news.bl;

import java.sql.Connection;
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

import org.jbit.news.bean.News;
import org.jbit.news.bean.Topic;

public class TopicManager {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	//ͨ��JNDI��ȡ���ݿ�����
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
	
	//��ȡ��������
	public List getAllTopics(){
		List list = new ArrayList();
		openConnection();
		String sql = "select * from topic";
		try{			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			while(rs.next()){
				Topic topic = new Topic();
				topic.setTid(String.valueOf(rs.getObject("tid")));
				topic.setTname(rs.getString("tname"));								
				list.add(topic);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return list;
	}
	
	//����id��ȡĳһ������
	public Map getTopicByTid(String tid){
		Map topic = null;
		openConnection();
		String sql = "select * from topic where tid=?";
		try{			
			ps = con.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(tid));
			rs = ps.executeQuery();	
			while(rs.next()){
				topic = new HashMap();
				topic.put("tid", String.valueOf(rs.getObject("tid")));
				topic.put("tname", rs.getString("tname"));								
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return topic;
	}	

	//����id��ȡĳһ������
	public Map getTopicByTname(String tname){
		Map topic = null;
		openConnection();
		String sql = "select * from topic where tname=?";
		try{			
			ps = con.prepareStatement(sql);
			ps.setString(1,tname);
			rs = ps.executeQuery();	
			while(rs.next()){
				topic = new HashMap();
				topic.put("tid", String.valueOf(rs.getObject("tid")));
				topic.put("tname", rs.getString("tname"));								
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return topic;
	}	
	
	//���һ���µ���������
	public int insertTopic(Topic t){
		int res=0;
		openConnection();
		String sql = "insert into topic values (null,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, t.getTname());
			res= ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeResource();
		}				
		return res;
	}
	
	//�޸�һ����������
	public int updateTopicByTid(String tid, Topic t){
		int res=0;
		openConnection();
		String sql = "update topic set tname=? where tid=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,t.getTname());
			ps.setInt(2,Integer.parseInt(tid));
			res= ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeResource();
		}				
		return res;
	}	
	
	//����tidɾ��һ������
	public int deleteTopicByTid(String tid){
		int res=0;
		openConnection();
		String sql = "delete from topic where tid=?";
		try{
			ps=con.prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(tid));
			res= ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeResource();
		}
		return res;
	}
	
	//�ͷ���Դ
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
