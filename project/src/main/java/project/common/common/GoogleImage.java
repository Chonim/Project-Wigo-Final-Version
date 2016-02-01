package project.common.common;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONException;
import org.json.JSONObject;

public class GoogleImage {
 public static void main(String[] args) throws IOException, IllegalAccessException, InvocationTargetException, NoSuchMethodException, JSONException {
        // TODO Auto-generated method stub
         
   String query = "초아";
   URL url = new URL("https://ajax.googleapis.com/ajax/services/search/images?" +
           "v=1.0&q=barack%20obama&userip=INSERT-USER-IP");

        URLConnection connection = url.openConnection();
        connection.addRequestProperty("Referer", "http://192.168.1.25:8081/project/");

        String line;
        StringBuilder builder = new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        while((line = reader.readLine()) != null) {
         builder.append(line);
        }
        System.out.println(builder);
        JSONObject json = new JSONObject(builder.toString());
    }
}
