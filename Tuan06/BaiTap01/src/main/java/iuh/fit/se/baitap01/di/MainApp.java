package iuh.fit.se.baitap01.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
    
    public static void main(String[] args) {
        System.out.println("=== BAI TAP 1: DEPENDENCY INJECTION ===");
        
        // Cach thu cong
        testManualWay();
        
        System.out.println("\n=== SPRING IOC/DI ===");
        
        // Cach Spring
        testSpringWay();
    }
    
    // Cach thu cong - tu tao object
    private static void testManualWay() {
        System.out.println("1. Tao object thu cong:");
        
        // Tao service
        EmailService emailService = new EmailService("gmail.com", 587);
        SMSService smsService = new SMSService("Twilio", "abc123");
        
        // Constructor injection thu cong
        NotificationManager emailManager = new NotificationManager(emailService, "Email Manager");
        
        // Setter injection thu cong
        NotificationManager smsManager = new NotificationManager();
        smsManager.setMessageService(smsService);
        smsManager.setManagerName("SMS Manager");
        
        // Su dung
        emailManager.sendNotification("user@gmail.com", "Test email");
        smsManager.sendNotification("0123456789", "Test SMS");
        
        System.out.println("Van de: Tight coupling, kho test, kho maintain");
    }
    
    // Cach Spring - Spring quan ly object
    private static void testSpringWay() {
        System.out.println("1. Khoi tao Spring container:");
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        
        System.out.println("2. Lay bean tu Spring:");
        
        // Constructor injection
        NotificationManager emailManager = (NotificationManager) context.getBean("emailNotificationManager");
        emailManager.sendNotification("user@spring.com", "Test email qua Spring");
        
        // Setter injection
        NotificationManager smsManager = (NotificationManager) context.getBean("flexibleNotificationManager");
        smsManager.sendNotification("0123456789", "Test SMS qua Spring");
        
        // Lay service truc tiep
        EmailService emailService = (EmailService) context.getBean("emailService");
        System.out.println("Service name: " + emailService.getServiceName());
        
        System.out.println("Uu diem: Loose coupling, de test, de maintain");
        
        ((ClassPathXmlApplicationContext) context).close();
    }
}