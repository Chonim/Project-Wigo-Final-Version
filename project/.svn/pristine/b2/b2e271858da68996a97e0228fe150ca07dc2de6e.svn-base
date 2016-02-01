package project.common.common;

import java.io.IOException;
import java.net.URLEncoder;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class RelativeKeyword {
	public String relativeSearch(String key) throws IOException {
		
		// 키워드 uri 인코딩 (안하면 에러)
		String keyword = key;
		keyword = URLEncoder.encode(keyword, "UTF-8");
		
		// 긁어오기
        Document document = Jsoup.connect("http://keyword.web2r.net/index.html?k=" +keyword).get();
        Elements elements = document.select("textarea");
        
        // 태그 자름
        String result = elements.toString();
        result = result.substring(44, result.length()-12);
        
        if (result.contains(",rq")) {
        	result = result.replaceAll(",rq", "");
        }
        
        return result;
	}
}