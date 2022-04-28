package com.project.market;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint(value = "/empChatting") // 서버가 어떤 주소로 바인딩 되는지를 정의
public class ChattingHandler
{
    // 세션 리스트
    private static final List<Session> sessionList = new ArrayList<Session>();
    
    private static Logger logger = LoggerFactory.getLogger(ChattingHandler.class);
    
    public ChattingHandler() 
    {
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    @OnOpen
    public void onOpen(Session session) 
    {
        logger.info("loginId: {}", session.getId());
        try 
        {
            final Basic basic = session.getBasicRemote();
            basic.sendText("<b>채팅방에 연결 되었습니다.<b>");
        }
        catch (Exception e) 
        {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) 
    {
        try 
        {
            for ( Session session : ChattingHandler.sessionList ) 
            {
                if ( !( self.getId().equals( session.getId() ) ) ) 
                {
                    session.getBasicRemote().sendText("<div style='float: left;'>"+ sender + "</div><br>" + "<div class='toChatting'>&ensp;" + message + "&ensp;</div><br>");
                }
            }
        }
        catch (Exception e) 
        {
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message, Session session) 
    {
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
        logger.info("Message From " + sender + ": " + message);
        
        try 
        {
            final Basic basic = session.getBasicRemote(); // 문자 전송 컨트롤
            basic.sendText("<div class='fromChatting'>&ensp;" + message + "&ensp;</div><br>");
        }
        catch (Exception e) 
        {
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message); // 보낸 사람을 제외한 연결된 세션에  메세지 전송
    }
    
    @OnError
    public void onError(Throwable e, Session session) {}
    
    @OnClose
    public void onClose(Session session) 
    {
        logger.info("Session " + session.getId() + " has ended");
        sessionList.remove(session);
    }
}
