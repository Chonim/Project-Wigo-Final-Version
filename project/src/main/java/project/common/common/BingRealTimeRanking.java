package project.common.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.google.gson.Gson;

public class BingRealTimeRanking {

	public String bing() throws Exception {

		Document document = Jsoup.connect("https://www.bing.com/search?q=%EB%B9%99&go=%EC%A0%9C%EC%B6%9C&qs=n&scope=web&pq=%E3%85%82&sc=8-1&sp=-1&sk=&cvid=9C8E89DE9AAA4136B5F230410C79FCC8&setmkt=ko-kr&setlang=ko-kr&FORM=SEENCN").get();

		String jsonBing = null;
		Gson gson = new Gson();
		ArrayList<Map<String, String>> list = new ArrayList<>();

		if (null != document) {

			Elements elements = document.select("li.b_ans > .popnow > .b_vPanel > div > a");

			for (int i = 0; i < elements.size(); i++) {
				Map<String, String> map = new HashMap<String, String>();

				map.put("title", elements.get(i).attr("title"));
				map.put("url", "https://www.bing.com" + elements.get(i).attr("href"));
				list.add(map);
			}
			jsonBing = gson.toJson(list);
		}
		return jsonBing;
	}
}
