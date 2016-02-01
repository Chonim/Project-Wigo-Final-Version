package project.common.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.google.gson.Gson;

public class WordCloud {

	public String wordList() throws Exception {
		
		// bing
		Document document = Jsoup.connect("https://www.bing.com/search?q=%EB%B9%99&go=%EC%A0%9C%EC%B6%9C&qs=n&scope=web&pq=%E3%85%82&sc=8-1&sp=-1&sk=&cvid=9C8E89DE9AAA4136B5F230410C79FCC8&setmkt=ko-kr&setlang=ko-kr&FORM=SEENCN").get();
		ArrayList<List<String>> list = new ArrayList<>();

		if (null != document) {
			Elements elements = document.select("li.b_ans > .popnow > .b_vPanel > div > a");
			for (int i = 0; i < elements.size(); i++) {
				List<String> inList = new ArrayList<>();
				inList.add(elements.get(i).attr("title"));
				inList.add(i+"");
				list.add(inList);
			}
		}
		
		// daum
	   Document document2 = Jsoup.connect("http://www.daum.net").get();
	   if (null != document2) {
           Elements elements = document2.select("ol#realTimeSearchWord > li > div.roll_txt > div:not(.rank_dummy)");
           for (int i = 0; i < elements.size(); i++) {
               elements.get(i).select("span.screen_out").remove();
				List<String> inList = new ArrayList<>();
				if ((list.toString().contains(elements.get(i).select("span.txt_issue > a").text())) == false) {
					inList.add(elements.get(i).select("span.txt_issue > a").text());
					inList.add(i+"");
					list.add(inList);
				} 
           }
       }
	   // naver
       Document document3 = Jsoup.connect("http://www.naver.com").get();
       if (null != document3) {
           Elements elements = document3.select("ol#realrank > li:not(#lastrank) > a");
           for (int i = 0; i < elements.size(); i++) {
				List<String> inList = new ArrayList<>();
				if ((list.toString().contains(elements.get(i).attr("title"))) == false) {
				inList.add(elements.get(i).attr("title"));
				inList.add(i+"");
				list.add(inList);
				}
           }
       }
       // zum
		Document document4 = Jsoup.connect("http://zum.com/#!/home").get();
		if (null != document4) {
			Elements elements = document4.select("ul.rank_list > li.d_rank > a:not(.d_ready)");
			for (int i = 0; i < elements.size(); i++) {
				List<String> inList = new ArrayList<>();
				if ((list.toString().contains(elements.get(i).select("span.keyword").text())) == false) {
				inList.add(elements.get(i).select("span.keyword").text());
				inList.add(i+"");
				list.add(inList);
				}
			}
		}
		
		String json = null;
		Gson gson = new Gson();
        json = gson.toJson(list);
        return json;
	}
}
