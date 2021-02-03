package com.bald.controller;

import com.bald.ImportantTask.SendCode;
import com.bald.ImportantTask.SendEmail;
import com.bald.domain.Credit;
import com.bald.domain.Gift;
import com.bald.domain.Payment;
import com.bald.domain.User;
import com.bald.service.CreditService;
import com.bald.service.GiftService;
import com.bald.service.PaymentService;
import com.bald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.aliyuncs.exceptions.ClientException;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String findAll(Model model){
        // 调用service的方法
        List<User> list = userService.findAll();
        model.addAttribute("list",list);
        return "listAll";
    }

    @RequestMapping("/findByEmail")
    public String findByEmail(Model model,String email,String password){
        // 调用service的方法

        List<User> list = userService.findByEmail(email,password);
        if(list.size()==0){
            return "logerror";
        }
        model.addAttribute("list",list);
        return "list";

    }


    /**
     * 保存账户
     * @return
     */
    @RequestMapping("/save")
    public String save(User user) {
        User find = userService.findRepeatEmail(user.getEmail());
        if(find!=null){
            return "repeat";
        }
        userService.saveUser(user);
        return "success";
    }

    /**
     * 检查重复账户
     * @return
     */
    @RequestMapping("/checkRepeat")
    public @ResponseBody
    String checkRepeat(String email){

        //客户端发送ajax请求，传的是json字符串，后端把json字符串封装到user对象中
        User find = userService.findRepeatEmail(email);
        if(find!=null){
            return "This email is already exist, please register again.";
        }

        return "success";

    }

    /**
     * 更改账户
     * @return
     */
    @RequestMapping("/edit")
    public String edit(Model model,@RequestParam("email") String email) {

        model.addAttribute("email",email);

        return "edit";
    }

    /**
     * 更改账户实际操作
     * @return
     */
    @RequestMapping("/update")
    public String update(Model model,@RequestParam("email") String email,@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("sex") String sex,@RequestParam("address") String address) throws IOException {

        User user=userService.findRepeatEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(sex);
        user.setAddress(address);
        userService.updateUser(user);
        System.out.println("email");
        System.out.println("email is: "+email);
        model.addAttribute("email",user.getEmail());
        model.addAttribute("password",user.getPassword());
        return "editsuccess";
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam("email") String email) {
        userService.deleteUser(email);

        return "deletesuccess";
    }

    @Autowired
    private GiftService giftService;

    /**
     * 查询礼物
     * @param model
     * @param point
     * @return
     */
    @RequestMapping(path = "/findGift",method = RequestMethod.POST)
    public String findGift(Model model,@RequestParam("email") String email,@RequestParam("password") String password,@RequestParam("point") Integer point){
        System.out.println(point);
        System.out.println(email);
        System.out.println(password);
        // 调用service的方法
        List<Gift> list = giftService.findAll();
        model.addAttribute("point",point);
        model.addAttribute("email",email);
        model.addAttribute("password",password);
        model.addAttribute("list",list);

        return "gift";
    }

    /**
     * 兑换礼物
     * @param model
     * @return
     */
    @RequestMapping(path = "/exchangeGift",method = RequestMethod.POST)
    public String exchangeGift(Model model,@RequestParam("name") String name,@RequestParam("number") Integer number,@RequestParam("email") String email,@RequestParam("password") String password){
        // 调用service的方法
        Gift gift=giftService.findByName(name);
        gift.setNumber(number-1);
        int var=gift.getPoint();
        giftService.updateGift(gift);

        List<User> users=userService.findByEmail(email,password);
        int point=users.get(0).getPoint()-var;
        //point=-point;
        users.get(0).setPoint(point);
        userService.updateUser(users.get(0));
        int creditStatus=-var;

        String str = "0123456789abcdefghij";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 20; i++) {
            int numberR = random.nextInt(20);
            sb.append(str.charAt(numberR));
        }
        String transactionID=sb.toString();

        System.out.println("transactionID: "+transactionID);
        creditService.saveCreditIncludeNull(transactionID,creditStatus,email);
        model.addAttribute("email",email);
        model.addAttribute("password",password);
        model.addAttribute("name",name);
        model.addAttribute("point",point);

        return "exchange";
    }

    @RequestMapping(path="/bindPayment",method = RequestMethod.POST)
    public String toBindPayment(Model model,@RequestParam("email") String email,@RequestParam("password") String password){
       // System.out.println(email);
        List<User> users=userService.findByEmail(email,password);
        if(users.get(0).getBalance()!=-1){
            model.addAttribute("email",email);
            model.addAttribute("password",password);
            return "alreadyBind";
        }
        else {
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            return "bindPayment";
        }
    }

    //private CodeService codeService;
    @RequestMapping(path = "/phonecode")
    public String sendCodeToPhone(HttpServletRequest request1) throws ClientException {

        String phonenumber=request1.getParameter("phonenumber").toString();
        String code=request1.getParameter("code").toString();
        String email=request1.getParameter("email").toString();
        SendCode sd=new SendCode();
        sd.sendVerification(phonenumber,code);
        return "bindPayment";
    }

    @Autowired
    private  PaymentService paymentService;
    @RequestMapping(path = "/savebinding",method = RequestMethod.POST)
    public String saveBindingInformation(Model model,Payment payment,@RequestParam("email") String email,@RequestParam("password")String passowrd,@RequestParam("paymentPassword") String paymentPassword){
        paymentService.savePayment(payment);
        userService.updateBalance(email);
        System.out.println(paymentPassword);
        userService.updatePaymentPassword(paymentPassword,email);
        //model.addAttribute("paymentPassword",paymentPassword);
        model.addAttribute("email",email);
        model.addAttribute("password",passowrd);
        return "successPayment";
    }

    @RequestMapping(path = "/renewMembership",method = RequestMethod.POST)
    public String renewMembership(Model model,@RequestParam("email") String email,@RequestParam("password") String password){
        List<User> list=userService.findByEmail(email,password);
        model.addAttribute("list",list);
        return "renew";
    }

    @RequestMapping(path="/saveRenew",method = RequestMethod.POST)
    public String updateRenewInfo(Model model,@RequestParam("email") String email,@RequestParam("password") String password,@RequestParam("memberLength") Integer memberLength,@RequestParam("Balance") Integer Balance){
        userService.renewUpdate(email,memberLength,Balance);
        model.addAttribute("email",email);
        model.addAttribute("password",password);
        return"renewsuccess";
    }

    @RequestMapping(path="/toCredit",method = RequestMethod.POST)
    public String toCredit(Model model,@RequestParam("email") String email,@RequestParam("password") String password){
        //model.addAttribute("email",email);
        //model.addAttribute("password",password);
        List<User> list=userService.findByEmail(email,password);
        model.addAttribute("list",list);
        return "generate";
    }

    @Autowired
    private CreditService creditService;

    @RequestMapping(path = "/credit")
    public String insertRecord(Credit credit,HttpServletRequest request1,Model model) throws IOException {
        creditService.saveCreditId(credit);
        Integer point=Integer.valueOf(request1.getParameter("point").toString());
        String email=request1.getParameter("email").toString();
        Integer experience=Integer.valueOf(request1.getParameter("experience").toString());
        userService.updatePoint(email,point,experience);
        return "success";
    }

    @RequestMapping(path = "/searchDetail",method = RequestMethod.POST)
    public String searchRecord(Model model,@RequestParam("transactionID") String transactionID,@RequestParam("email")String email,@RequestParam("password") String password){
        List<Credit> list = creditService.findTransaction(transactionID);
        model.addAttribute("list", list);
        if(list.size()==0){
            model.addAttribute("email",email);
            model.addAttribute("password",password);
            return "Invalid";
        }
        else if(!list.get(0).getEmail().equals(email)){
            model.addAttribute("email",email);
            model.addAttribute("password",password);
            return "NoAuth";
        }
        else {
            List<User> users = userService.findByEmail(email, password);
            model.addAttribute("users", users);
            System.out.println("haha" + users.get(0).getEmail() + " " + list.get(0).getFood());
            return "g1";
        }
    }

    @RequestMapping(path="/toCreditHistory",method = RequestMethod.POST)
    public String getCreditHistory(Model model,@RequestParam("email") String email,@RequestParam("password")String password){
        model.addAttribute("email",email);
        model.addAttribute("password",password);
        List<Credit> History=creditService.findHistory(email);
        if(History.size()==0){
            return "historyf";
        }
        else {
            model.addAttribute("History", History);
            return "creditH";
        }
    }

    @RequestMapping(path = "/toVerify",method = RequestMethod.POST)
    public String toVerifyPage(Model model,@RequestParam("email") String email,@RequestParam("password")String password){
        List<User> users=userService.findByEmail(email,password);
        model.addAttribute("email",email);
        model.addAttribute("password",password);
        if(users.get(0).getBindFlag().equals("true")){
            return "alreadyV";
        }
        else {
            return "verify";
        }
    }

    @RequestMapping(path = "/emailcode")
    public String sendEmailCode(@RequestParam("email") String email,@RequestParam("code") String code){
        SendEmail se=new SendEmail();
        se.sendMailMessage(code,email);
        return "success";
    }

    @RequestMapping(path = "/updateFlag",method = RequestMethod.POST)
    public String updateFlag(Model model,@RequestParam("email") String email,@RequestParam("password") String password){
        String BindFlag="true";
        userService.updateFlag(email,BindFlag);
        model.addAttribute("email",email);
        model.addAttribute("password",password);
        return "emailS";
    }

    @RequestMapping(path="/toResetPP",method = RequestMethod.POST)
    public String resetPayment(Model model,@RequestParam("email") String email,@RequestParam("password") String password){
        List<User> users=userService.findByEmail(email,password);
        if(users.get(0).getBindFlag().equals("false")){
            model.addAttribute("email",email);
            model.addAttribute("password",password);
            return "toVEmail";
        }
        else {
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            return "repp";
        }
    }

    @RequestMapping(path = "/updatePP",method = RequestMethod.POST)
    public String resetPP(Model model,@RequestParam("email") String email,@RequestParam("password") String password,@RequestParam("paymentPassword") String paymentPassword){
        userService.updatePaymentPassword(paymentPassword,email);
        model.addAttribute("email",email);
        model.addAttribute("password",password);
        return "ppwdS";

    }

    @RequestMapping(path="/resetpwd",method = RequestMethod.POST)
    public String resetpwd(@RequestParam("email") String email,@RequestParam("password") String password){
        userService.updatePWD(email,password);
        return "PWDS";
    }

    @RequestMapping(path = "/emailcode2")
    public String sendEmailCode2(@RequestParam("email") String email,@RequestParam("code") String code){
      /*  SendEmail se=new SendEmail();
        se.sendMailMessage(code,email);*/
        System.out.println("haha");
        return "success";
    }
}


