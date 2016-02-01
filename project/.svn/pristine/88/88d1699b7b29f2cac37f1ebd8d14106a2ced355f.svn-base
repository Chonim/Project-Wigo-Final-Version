package project.common.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.google.gson.Gson;

public class JsoupParsing {
       
   public String naver() throws IOException {
           Document document = Jsoup.connect("http://www.naver.com").get();
            
           String jsonDaum = null;
           Gson gson = new Gson();
           ArrayList<Map<String, String>> list = new ArrayList<>();
           
           if (null != document) {
               // id가 realrank 인 ol 태그 아래 id가 lastrank인 li 태그를 제외한 모든 li 안에 존재하는
               // a 태그의 내용을 가져옵니다.
               Elements elements = document.select("ol#realrank > li:not(#lastrank) > a");
               
               for (int i = 0; i < elements.size(); i++) {
                  Map<String, String> map = new HashMap<String, String>();
                  
                   map.put("title", elements.get(i).attr("title"));
                   map.put("url", elements.get(i).attr("href"));
                   list.add(map);
               }
               jsonDaum = gson.toJson(list);
           }
           return jsonDaum;
       }
   }
