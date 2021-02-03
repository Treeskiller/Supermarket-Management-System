package com.bald.ImportantTask;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;


public class SendEmail {
   /* public static void main(String[] args) {
        String msg="Your verification code is: "+8543;
        SendEmail.sendMailMessage(msg,"1033204335@qq.com");
    }*/
    /**
     * 发送邮件实现类
     * @param msg
     */
    public  void sendMailMessage(String msg,String emailAddress) {
        try {
            //邮箱服务器地址如：mail.qq.com
            String hostName ="smtp.qq.com";
            // 帐号与密码
            String userName ="1033204335";
            String password = "vuneokatksqrbfjc";
            // 发件人
            String fromAddress ="1033204335@qq.com";
            // 发件人姓名
            String fromName = "Bald";
            msg="This is your verification code: "+msg;
            HtmlEmail email=new HtmlEmail();
            email.setHostName(hostName);// 设置smtp服务器
            email.setAuthentication(userName, password);// 设置授权信息
            email.setCharset("utf-8");
            email.setFrom(fromAddress, fromName, "utf-8");// 设置发件人信息
            email.setSubject("testMail");// 设置主题
            email.setHtmlMsg(msg);// 设置邮件内容
            email.addTo(emailAddress, "Ziyao", "utf-8");
            System.err.println(email.getSmtpPort());
            System.err.println(email.getHostName());
            String res = email.send();// 发送邮件
            System.err.println(res);
        } catch (EmailException e) {
            System.err.println("邮件发送失败");
            e.printStackTrace();
        }
    }
}

