package project.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting/{username}")
public class Broadsocket {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static List<Object> list = Collections.synchronizedList(new ArrayList<>());
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		synchronized (clients) {
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			} 
		}
	}

	@OnOpen
	public void onOpen(Session session,@PathParam("username") String userName) throws IOException, EncodeException {
		clients.add(session);

		if (list.contains(userName)) {
	 	} else {list.add(userName); }
		
		synchronized (clients) {
			for (Session client : clients) {
				client.getBasicRemote().sendText(list.toString());
			} 
		}
		System.out.println(list.toString());
	}

	@OnClose
	public void onClose(Session session,@PathParam("username") String userName) throws IOException {
		clients.remove(session);
		list.remove(userName);
		
		synchronized (clients) {
			for (Session client : clients) {
				client.getBasicRemote().sendText(list.toString());
			} 
		}
		System.out.println(list.toString());
	}
}

/*import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import project.chat.controller.ChatService;

@ServerEndpoint("/broadcasting")
public class Broadsocket {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	
	private static int i=1;
	private static final String GUEST_PREFIX = "Guest";
	private static String nickname;
	private static final AtomicInteger connectionIds = new AtomicInteger(0);
	private static final Logger logger = LoggerFactory.getLogger(ChatService.class);

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("온 메시지: "+message);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			
			System.out.println("현재 접속자 수 Thread: " + Thread.activeCount());
			System.out.println("현재 접속자 이름: " + Thread.currentThread().getName());
			
			nickname = GUEST_PREFIX + connectionIds.getAndIncrement();
			logger.info("뭐야 접속했대");
			
			
			for (Session client : clients) {
				
				System.out.println("접속자 수: " + i);
				i++;

				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			} 
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println("접속자: "+session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
		System.out.println("나간사람: "+ session);
		i--;
		System.out.println("접속자 수: " + i);
	}
}*/