package iuh.fit.se.baitap01.di;

// Class su dung MessageService - minh hoa DI
public class NotificationManager {
    
    private MessageService messageService;
    private String managerName;
    
    // Constructor injection
    public NotificationManager(MessageService messageService) {
        this.messageService = messageService;
        this.managerName = "Default Manager";
    }
    
    public NotificationManager(MessageService messageService, String managerName) {
        this.messageService = messageService;
        this.managerName = managerName;
    }
    
    // Constructor mac dinh cho setter injection
    public NotificationManager() {
        this.managerName = "Default Manager";
    }
    
    // Setter injection
    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
    
    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }
    
    // Phuong thuc su dung service
    public void sendNotification(String recipient, String message) {
        if (messageService == null) {
            System.out.println("Error: MessageService not injected!");
            return;
        }
        
        System.out.println("Manager: " + managerName);
        System.out.println("Using: " + messageService.getServiceName());
        messageService.sendMessage(recipient, message);
    }
    
    // Getter
    public MessageService getMessageService() {
        return messageService;
    }
    
    public String getManagerName() {
        return managerName;
    }
}