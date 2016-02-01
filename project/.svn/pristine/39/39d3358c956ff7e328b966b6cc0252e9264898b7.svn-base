package project.common.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.google.gson.Gson;

public class NaverNewsRealTime {
	 
    public String naverNews() throws Exception {
         
    	Document document = Jsoup.connect("http://news.naver.com").get();
        
        String jsonNaverNews = null;
        Gson gson = new Gson();
        ArrayList<Map<String, String>> list = new ArrayList<>();
         
        if (null != document) {
        	
            // class 가 rank_dummy 를 가지고 있는 div 태그는 포함시키지 않는다.
        	Elements elements = document.select("div.lnb_today > div > ul > li");
            
        	String title="";
        	
            for (int i = 0; i < elements.size(); i++) {
            	Map<String, String> map = new HashMap<String, String>();
            	title = elements.get(i).select("a").attr("title");

            	if(title.contains("\"")) {
            		title = title.replace("\"", "\'");
            	}
            	// System.out.println(title);
            	map.put("title", title);
                map.put("url", elements.get(i).select("a").attr("href"));
                list.add(map);
            }
            jsonNaverNews = gson.toJson(list);
        }
        return jsonNaverNews;
    }
}
