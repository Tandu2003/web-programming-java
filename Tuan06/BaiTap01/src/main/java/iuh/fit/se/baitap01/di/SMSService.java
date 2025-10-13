package iuh.fit.se.baitap01.di;

// Class gui SMS
public class SMSService implements MessageService {
    
    private String provider;
    private String apiKey;
    
    public SMSService() {
        this.provider = "Twilio";
        this.apiKey = "default-key";
    }
    
    public SMSService(String provider, String apiKey) {
        this.provider = provider;
        this.apiKey = apiKey;
    }
    
    @Override
    public boolean sendMessage(String to, String message) {
        System.out.println("SMS to: " + to);
        System.out.println("Message: " + message);
        System.out.println("Provider: " + provider);
        return true;
    }
    
    @Override
    public String getServiceName() {
        return "SMS Service";
    }
    
    // Getter/Setter cho Spring
    public String getProvider() {
        return provider;
    }
    
    public void setProvider(String provider) {
        this.provider = provider;
    }
    
    public String getApiKey() {
        return apiKey;
    }
    
    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }
}