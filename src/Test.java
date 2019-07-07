import java.util.List;

import org.jbit.news.bean.News;
import org.jbit.news.util.PageManager;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		PageManager pm = new PageManager();
		pm.setPage_info_no(15);
		pm.setTotal_info(73);
		List<String> list = pm.getSqls("news", "nid", "ncreatedate");
		for(String sql:list){
			System.out.println(sql);
		}
		
	}

}
