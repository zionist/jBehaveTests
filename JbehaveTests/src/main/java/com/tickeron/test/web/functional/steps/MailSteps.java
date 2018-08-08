package com.tickeron.test.web.functional.steps;

import com.tickeron.test.common.exceptions.AssertionErrorWithContextParamsException;
import com.tickeron.test.web.functional.steps.ParamsAndVariablesSteps;
import com.tickeron.test.web.functional.steps.SeleniumSteps;
import com.tickeron.test.web.functional.steps.service.ServiceStepsBasic;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.JavascriptExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static org.junit.Assert.*;

/**
 * Created by slaviann on 17.12.15.
 * Mail client class
 */
//@PropertySource("classpath:app.properties")

public class MailSteps {

    @Autowired
    private Environment env;

    @Autowired
    private ParamsAndVariablesSteps paramsAndVariablesSteps;

    @Autowired
    private SeleniumSteps seleniumSteps;

    @Autowired
    private ServiceStepsBasic serviceStepsBasic;

    @Autowired
    private ApplicationContext applicationContext;

    private Properties props = new Properties();
    private String host;
    private String username;
    private String password;
    private Integer port;
    private String provider;
    private final String inboxfolderName = "INBOX";
    private Message lastMessage;
    private Session session = Session.getDefaultInstance(props, null);
    private Store store;

    /**
    * Simple interface class. We can't use javax.mail.Message after Folder close
    */
    public class Message {
        public String from, subject, body;

    }

    public MailSteps(String host, String username, String password, Integer port, String provider) {
        this.host=host;
        this.password = password;
        this.username = username;
        this.port = port;
        this.provider = provider;


        String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        props.setProperty("mail.pop3.socketFactory.class", SSL_FACTORY);
        try {
            store = session.getStore(provider);
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    @When("I receive email message")
    public void setLastMessage() throws IOException, MessagingException {
        List<Message> messages = getMessages();
        lastMessage = messages.get(messages.size() - 1);
    }

    @Then("I see last email message body contains $string")
    @Alias("I see last email message body contains: $string")
    public void checkLastMessageContains(String string) {
        assertTrue(getLastMessage().body.contains(string));

    }

    @Then("I see last email message from is $from")
    public void checkLastMessageFrom(String from) {
        assertEquals(from, getLastMessage().from);

    }

    @Then("I see last email message subject is $subject")
    public void checkLastMessageSubject(String subject) {
        try {
            assertEquals(subject, getLastMessage().subject);
        } catch (AssertionError e) {
            throw (AssertionErrorWithContextParamsException)applicationContext.getBean("assertionErrorWithContextParamsException", e);
        }

    }

    public Message getLastMessage() {
        if(lastMessage == null) {
            throw new RuntimeException("Email client has not received email");
        }
        return lastMessage;
    }

    public List<Message> getMessages() throws MessagingException, IOException {
        List<Message> messages = new ArrayList<>();
        store.connect(host, port, username, password);

        Folder inbox = store.getFolder(inboxfolderName);
        inbox.open(Folder.READ_ONLY);

        javax.mail.Message[] mesgs = inbox.getMessages();
        for (int i = 0; i < mesgs.length; i++) {
            Message message = new Message();
            message.from = mesgs[i].getFrom()[0].toString();
            message.subject = mesgs[i].getSubject();
            if (mesgs[i].getContent().getClass().equals(javax.mail.internet.MimeMultipart.class)) {
                MimeMultipart obj = (javax.mail.internet.MimeMultipart) mesgs[i].getContent();
                message.body = obj.getBodyPart(0).getContent().toString();
            } else {
                message.body = mesgs[i].getContent().toString();
            }
            messages.add(message);
        }

        inbox.close(false);
        store.close();
        return messages;
    }

    @Given("I will delete all messages from email")
    public  void deleteAllMessagesFromInbox() throws MessagingException {
        store.connect(host, port, username, password);

        Folder inbox = store.getFolder(inboxfolderName);
        inbox.open(Folder.READ_WRITE);

        javax.mail.Message[] mesgs = inbox.getMessages();
        for (int i = 0; i < mesgs.length; i++) {
            mesgs[i].setFlag(Flags.Flag.DELETED, true);
        }
        inbox.close(true);
        store.close();

    }

    @Then("I save link with text $text in email message to param $param")
    public void saveParamFromMailLnk(String text, String param) throws IOException {
        Document doc = Jsoup.parse(getLastMessage().body);
        Elements elements = doc.select("a");
        for (Element element : elements) {
            if(element.hasText() && element.ownText().equals(text)) {
                paramsAndVariablesSteps.getTestParamsStorage().put(param, element.attr("href"));
            }
        }

    }


}
