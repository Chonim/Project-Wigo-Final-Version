package project.common.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.google.gson.Gson;

public class DaumRealTimeRanking {
	 
    public String daum() throws Exception {
         
        Document document = Jsoup.connect("http://www.daum.net").get();
        
        String jsonString = null;
        Gson gson = new Gson();
        ArrayList<Map<String, String>> list = new ArrayList<>();
         
        if (null != document) {
        	
            // class 가 rank_dummy 를 가지고 있는 div 태그는 포함시키지 않는다.
            Elements elements = document.select("ol#realTimeSearchWord > li > div.roll_txt > div:not(.rank_dummy)");
             
            for (int i = 0; i < elements.size(); i++) {
            	Map<String, String> map = new HashMap<String, String>();

                elements.get(i).select("span.screen_out").remove();
                 
                map.put("title", elements.get(i).select("span.txt_issue > a").text());
                map.put("url", elements.get(i).select("span.txt_issue > a").attr("href"));
                list.add(map);
            }
            jsonString = gson.toJson(list);
        }
        return jsonString;
    }
}

