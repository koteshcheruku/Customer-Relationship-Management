package com.example.crm.component;

import lombok.RequiredArgsConstructor;
import com.example.crm.service.LogService;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.security.Principal;

@Component
@RequiredArgsConstructor
public class LoginListener {
    private final LogService service;

    @EventListener
    public void onlineSuccess(SessionConnectEvent event) {
        Principal user = StompHeaderAccessor.wrap(event.getMessage()).getUser();
        try {
            assert user != null;
            service.onLogin(user.getName());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @EventListener
    public void offlineSuccess(SessionDisconnectEvent event) {
        Principal user = StompHeaderAccessor.wrap(event.getMessage()).getUser();
        if (user != null)
            service.onLogout(user.getName());
    }
}
