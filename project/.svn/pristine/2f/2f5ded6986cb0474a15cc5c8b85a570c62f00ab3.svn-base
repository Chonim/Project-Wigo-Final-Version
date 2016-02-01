package project.common.twitter;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class Tweets {
   public String tweets(String key) throws Exception {

      ConfigurationBuilder cb = new ConfigurationBuilder();
      cb.setDebugEnabled(true).setOAuthConsumerKey("BywTvVUhxtzp5vWs5zfE61QzG")
            .setOAuthConsumerSecret("qUJZqmEklymAKWlFwDEO2dmLL2WP6RIQUCM3gOq40bQ5yulf3M")
            .setOAuthAccessToken("216038065-8satml5aCtuLnq4ZqCxWpRVzMXOXYcd68V2oUOzK")
            .setOAuthAccessTokenSecret("Si0d0mDCODrBl8xR1osDiCQ0jtKcnzytCdNibgRj1pw49");

      Twitter twitter = new TwitterFactory(cb.build()).getInstance();
      String queryInput = "#" + key;
      Query query = new Query(queryInput);
      int numberOfTweets = 50;
      long lastID = Long.MAX_VALUE;
      ArrayList<Status> tweets = new ArrayList<Status>();
      String tweetsJson = "";
      Gson gson = new Gson(); 

      ArrayList<Map<String, String>> list = new ArrayList<>();

      int previouslyGathered = 0;
      while (tweets.size() < numberOfTweets) {
         if (numberOfTweets - tweets.size() > 10)
            query.setCount(10);
         else
            query.setCount(numberOfTweets - tweets.size());
         try {
            QueryResult result = twitter.search(query);
            tweets.addAll(result.getTweets());
         //   System.out.println("Gathered " + tweets.size() + " tweets" + "\n");
            for (Status t : tweets)
               if (t.getId() < lastID)
                  lastID = t.getId();

         }

         catch (TwitterException te) {
            System.out.println("Couldn't connect: " + te);
         }
         query.setMaxId(lastID - 1);
         
        // System.out.println("tweets.size() " + tweets.size());
        // System.out.println("numberOfTweets " + numberOfTweets);
         
         if(tweets.size() == 0) {
            break;
         }
         
         if (previouslyGathered == tweets.size()) {
            break;
         }
         
         previouslyGathered = tweets.size();
      }

      for (int i = 0; i < tweets.size(); i++) {
         Map<String, String> map = new HashMap<String, String>();
         Status t = (Status) tweets.get(i);

         // GeoLocation loc = t.getGeoLocation();
         String profileImage = t.getUser().getProfileImageURL();
         String userName = t.getUser().getName();
         String userScreenName = t.getUser().getScreenName();
         String lang = t.getLang();
         Date createdTime = t.getCreatedAt();
         Date currentTime = new Date();
         
         String howLongBefore = "";
         
        // System.out.println(createdTime);
        // System.out.println(currentTime);
         
         if (currentTime.getTime()/1000/60/60/24/7/30/12 - createdTime.getTime()/1000/60/60/24/7/30/12 > 0) {
            howLongBefore = (Long.toString(currentTime.getTime()/1000/60/60/24/7/30/12 - createdTime.getTime()/1000/60/60/24/7/30/12)+"년 전");
            
         } else if ((currentTime.getTime()/1000/60/60/24/7/30 - createdTime.getTime()/1000/60/60/24/7/30) > 0) {
            howLongBefore = (Long.toString(currentTime.getTime()/1000/60/60/24/7/30 - createdTime.getTime()/1000/60/60/24/7/30)+"달 전");
         
         /*} else if ((currentTime.getTime()/1000/60/60/24/7 - createdTime.getTime()/1000/60/60/24/7) > 0) {
            howLongBefore = (Long.toString(currentTime.getTime()/1000/60/60/24/7 - createdTime.getTime()/1000/60/60/24/7)+"주 전");
            System.out.println(currentTime.getTime()/1000/60/60/24/7 - createdTime.getTime()/1000/60/60/24/7);*/
         
         } else if (currentTime.getTime()/1000/60/60/24 - createdTime.getTime()/1000/60/60/24 > 0) {
            howLongBefore = (Long.toString(currentTime.getTime()/1000/60/60/24 - createdTime.getTime()/1000/60/60/24)+"일 전");
         
         } else if ((currentTime.getTime()/1000/60/60 - createdTime.getTime()/1000/60/60) > 0) {
            howLongBefore = (Long.toString(currentTime.getTime()/1000/60/60 - createdTime.getTime()/1000/60/60)+"시간 전");
         
         } else if (currentTime.getTime()/1000/60 - createdTime.getTime()/1000/60 > 0) {
            howLongBefore = (Long.toString(currentTime.getTime()/1000/60 - createdTime.getTime()/1000/60)+"분 전");
         
         } else  {
            howLongBefore = (Long.toString(currentTime.getTime()/1000 - createdTime.getTime()/1000)+"초 전");
         }
         
         //System.out.println(howLongBefore);
         
         /*Calendar currentCal = Calendar.getInstance();
         // 오늘
         currentCal.setTime(currentTime);
         Calendar createdCal = Calendar.getInstance();
         // 기준일
         createdCal.setTime(createdTime);
         
         int count = 0;
         while (!createdCal.after(currentCal)) {
            count++;
            // 다음날로 바뀜
            createdCal.add(Calendar.DATE, 1);
         }
         System.out.println(createdCal.get(Calendar.YEAR) + "년 " + ( createdCal.get ( Calendar.MONTH ) + 1 ) + "월 " + createdCal.get ( Calendar.DATE ) + "일" );
         System.out.println ( "기준일로부터 " + count + "일이 지났습니다." );*/
         
         String msg = t.getText();
         String url = t.getUser().getURL();

         map.put("profileImage", profileImage);
         map.put("userName", userName);
         map.put("userScreenName", userScreenName);
         map.put("msg", msg);
         map.put("lang", lang);
         map.put("howLongBefore", howLongBefore);
         map.put("url", url);
         list.add(map);
      }
      tweetsJson = gson.toJson(list);
      //System.out.println(tweetsJson);
      
      return tweetsJson;
   }
}