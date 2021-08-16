package com.KHJ.MailSend;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("rlaghdwn13", "gijzrisimhhqjoja");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
