package project.common.twitter;

import twitter4j.FilterQuery;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.User;
import twitter4j.conf.ConfigurationBuilder;

public class SimpleStream {
    public static void main(String[] args) {
        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true);
        cb.setOAuthConsumerKey("BywTvVUhxtzp5vWs5zfE61QzG");
        cb.setOAuthConsumerSecret("qUJZqmEklymAKWlFwDEO2dmLL2WP6RIQUCM3gOq40bQ5yulf3M");
        cb.setOAuthAccessToken("216038065-8satml5aCtuLnq4ZqCxWpRVzMXOXYcd68V2oUOzK");
        cb.setOAuthAccessTokenSecret("Si0d0mDCODrBl8xR1osDiCQ0jtKcnzytCdNibgRj1pw49");
        /*cb.setOAuthConsumerKey("tO0JKKsp58TaLEBqNTXX2Qjt7");
        cb.setOAuthConsumerSecret("mP2L0NDoNDx5CZRpKeqeuOnp9Xm99p4epJiZewJwDeoNMgxHAt");
        cb.setOAuthAccessToken("3023424703-elpk7oZiFdN22iD0V63w1yxxMnwAFZc8oSdJi4Z");
        cb.setOAuthAccessTokenSecret("2aihnAo1XLU7AmslZoVDAD30v61WofQ5jre9trUDyx4wH");*/

        TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();

        StatusListener listener = new StatusListener() {

            @Override
            public void onException(Exception arg0) {
                // TODO Auto-generated method stub
            }

            @Override
            public void onDeletionNotice(StatusDeletionNotice arg0) {
                // TODO Auto-generated method stub
            }

            @Override
            public void onScrubGeo(long arg0, long arg1) {
                // TODO Auto-generated method stub
            }

            @Override
            public void onStatus(Status status) {
                User user = status.getUser();
                
                // gets Username
                String username = status.getUser().getScreenName();
                System.out.println(username);
                String profileLocation = user.getLocation();
                System.out.println(profileLocation);
                String profileImage = user.getProfileImageURL();
                System.out.println(profileImage);
                long tweetId = status.getId(); 
                System.out.println(tweetId);
                String content = status.getText();
                System.out.println(content +"\n");

            }

            @Override
            public void onTrackLimitationNotice(int arg0) {
                // TODO Auto-generated method stub

            }

			@Override
			public void onStallWarning(StallWarning arg0) {
				// TODO Auto-generated method stub
				
			}

        };
        FilterQuery fq = new FilterQuery();
    
        // String keywords[] = {"hannibal"};
        String keywords[] = {"초아"};

        fq.track(keywords);

        twitterStream.addListener(listener);
        twitterStream.filter(fq);  

    }
}
