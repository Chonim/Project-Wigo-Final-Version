package project.common.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.google.gson.Gson;

public class ZumRealTimeRanking {

	public String zum() throws Exception {

		Document document = Jsoup.connect("http://zum.com/#!/home").get();

		String jsonZum = null;
		Gson gson = new Gson();
		ArrayList<Map<String, String>> list = new ArrayList<>();

		if (null != document) {

			Elements elements = document.select("ul.rank_list > li.d_rank > a:not(.d_ready)");

			for (int i = 0; i < elements.size(); i++) {
				Map<String, String> map = new HashMap<String, String>();

				map.put("title", elements.get(i).select("span.keyword").text());
				map.put("url", elements.get(i).attr("href"));
				list.add(map);
			}
			jsonZum = gson.toJson(list);
		}
		return jsonZum;
	}
}
