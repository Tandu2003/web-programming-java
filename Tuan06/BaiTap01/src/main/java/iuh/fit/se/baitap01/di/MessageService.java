package iuh.fit.se.baitap01.di;

// Interface cho cac loai dich vu gui tin nhan
public interface MessageService {
    
    boolean sendMessage(String to, String message);
    String getServiceName();
}