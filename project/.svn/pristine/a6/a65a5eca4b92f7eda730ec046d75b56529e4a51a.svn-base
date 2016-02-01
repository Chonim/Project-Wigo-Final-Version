/*package project.common.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class TwitterConsumer extends Thread {
    private final String ACCESS_TOKEN = "216038065-8satml5aCtuLnq4ZqCxWpRVzMXOXYcd68V2oUOzK";
    private final String ACCESS_SECRET = "Si0d0mDCODrBl8xR1osDiCQ0jtKcnzytCdNibgRj1pw49";
    private final String CONSUMER_KEY = "BywTvVUhxtzp5vWs5zfE61QzG";
    private final String CONSUMER_SECRET = "qUJZqmEklymAKWlFwDEO2dmLL2WP6RIQUCM3gOq40bQ5yulf3M";
    
    // 트위터 스트림을 받을 url 변수를 설정한다.
    // 트위터 스트림 중에서 특정 단어가 들어간 스트림만을 필터링해서 받으려면 track 변수에 지정한다.
    // 두가지 이상의 필터링 단어가 있는 경우, 콤마(,)로 구분하여 쓴다.
    private final String FEED_URL = "https://stream.twitter.com/1.1/statuses/filter.json?track=socurites,football";

 // 접속하기
    OAuthConsumer consumer = new CommonsHttpOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);
    consumer.setTokenWithSecret(ACCESS_TOKEN, ACCESS_SECRET);
    // POST status/filter 방식으로 받기 위해 HttpPost 객체를 생성한다.
    HttpPost request = new HttpPost(FEED_URL);
    consumer.sign(request);
     
    // 스트림을 받기 위한 HttpClient 객체를 생성한다.
    DefaultHttpClient client = new DefaultHttpClient();
    // 필터링 단어를 파라미터로 설정한다.
    HttpParams params = new BasicHttpParams();
    params.setParameter("track", "socurites,fooball");
    request.setParams(params);
     
    // 클라이언트 객체를 주어진 요청 객체(request)를 사용해서 실행하여 응답 객체를 생성한다.
    HttpResponse response = client.execute(request);
     
    // 아래는 응답 스트림을 출력하기 위한 코드
    BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
     
    // 전송받은 데이터 파일에 쓰기
    while (true) {
        String line = reader.readLine();
        if (line == null)
            break;
        if (line.length() > 0) {
            if (bytesWritten + line.length() + 1 > BYTES_PER_FILE)
                rotateFile();
            fw.write(line + "\n");
            bytesWritten += line.length() + 1;
            Messages++;
            Bytes += line.length() + 1;
        }
    }
}
*/