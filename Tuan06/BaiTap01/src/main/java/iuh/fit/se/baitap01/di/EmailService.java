package iuh.fit.se.baitap01.di;

// Class gui email
public class EmailService implements MessageService {
    
    private String smtpServer;
    private int port;
    
    public EmailService() {
        this.smtpServer = "smtp.gmail.com";
        this.port = 587;
    }
    
    public EmailService(String smtpServer, int port) {
        this.smtpServer = smtpServer;
        this.port = port;
    }
    
    @Override
    public boolean sendMessage(String to, String message) {
        System.out.println("Email to: " + to);
        System.out.println("Message: " + message);
        System.out.println("SMTP: " + smtpServer + ":" + port);
        return true;
    }
    
    @Override
    public String getServiceName() {
        return "Email Service";
    }
    
    // Getter/Setter cho Spring
    public String getSmtpServer() {
        return smtpServer;
    }
    
    public void setSmtpServer(String smtpServer) {
        this.smtpServer = smtpServer;
    }
    
    public int getPort() {
        return port;
    }
    
    public void setPort(int port) {
        this.port = port;
    }
}