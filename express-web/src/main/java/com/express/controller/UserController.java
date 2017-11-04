package com.express.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.express.commons.constant.ErrorCodeEnum;
import com.express.commons.util.JacksonUtils;
import com.express.commons.util.RetJacksonUtil;
import com.express.commons.util.SmsUtil;
import com.express.commons.vo.ExpressResult;
import com.express.dao.UserDao;
import com.express.domain.User;
import com.express.interceptor.HostHolder;
import com.express.service.MessageService;
import com.express.service.UserService;
import com.google.common.base.Strings;

/**
 * Created by xinghang on 17/9/28.
 */

@Controller
@RequestMapping("/user")
public class UserController {
  private Log LOG = LogFactory.getLog(UserController.class);

  @Autowired
  private UserService userService;

  @Autowired
  private HostHolder holder;
  @Autowired
  private UserDao userDao;
  @Autowired
  private MessageService messageService;
  //跳转到登录页面
  @RequestMapping("/loginPage")
  public String returnLogin(){
    return "login";
  }

  @ResponseBody
  @RequestMapping("/login")
  public String login(String account, String password, HttpServletRequest req, HttpServletResponse resp) {
    //String token = userService.login(account, password, req, resp);
    User user = userService.login(account, password, req, resp);
    Map result=new HashMap();
    if (user == null) {
      LOG.error("UserController.login.ERROR.token is null");
      result.put("result", false);
      result.put("message", "用户名和密码错误,请重新输入");
    } else {
      LOG.info("UserController.login.user:" + user.toString()) ;
      result.put("result", true);
      result.put("message", "登录成功!!");
      //获取用户的未读消息数量
      int countOfNews = messageService.countOfNotView(user.getId());
      holder.setCountNews(countOfNews);
      //将用户登录信息保存到holder中
      holder.setUser(user);
      holder.setUserId(user.getId());
      holder.setVip(user.getIsVip());
    }
    return JacksonUtils.toJson(result);
  }


  @RequestMapping("/token/{token}")
  public Object token(@PathVariable String token, String callback) {
    if (Strings.isNullOrEmpty(token)) {
      LOG.error("UserController.token.token is null");
      return "";
    }
    String result = userService.selByToken(token);
    LOG.info("UserController.token.callback.result = " + result);
    ExpressResult expressResult = new ExpressResult();
    if (!Strings.isNullOrEmpty(result)) {
      expressResult.setStatus(200);
      expressResult.setMsg("OK");
      expressResult.setData(result);
    } else {
      expressResult.setStatus(500);
      expressResult.setMsg("ERROR");
    }
    if (!Strings.isNullOrEmpty(callback)) {
      LOG.info("UserController.token.callback = " + callback);
      MappingJacksonValue mjv = new MappingJacksonValue(expressResult);
      mjv.setJsonpFunction(callback);
      return mjv;
    } else {
      LOG.info("UserController.token.callback is null");
      return expressResult;
    }

  }

  @RequestMapping("/logout")
  public Object logout(HttpServletRequest req, HttpServletResponse resp, String callback) {
    ExpressResult expressResult = new ExpressResult();
    try {
      userService.logout(req, resp);
      holder.removeAll();
      return "login";
    } catch (Exception e) {
      LOG.error("UserController.logout.ERROR", e);
      return "index";
    }
  }

  @RequestMapping(value="/register",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
  @ResponseBody
  public String register(User user, int code) {
    if (user.getAccount() == null ||user.getPassword() == null || user.getPhone() == 0) {
      LOG.error("UserController.register.parameter is null");
      return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.NO_PARAM);
    }

    int codeOld = (int)holder.getAttribute(String.valueOf(user.getPhone()));
    if(codeOld != code) {
      LOG.error("UserController.register.code is error. phone : " + user.getPhone());
      return JacksonUtils.toJson("验证码错误");
    }
    LOG.info("UserController.register.params:{account : "+ user.getAccount() + "password : "+ user.getPassword() + "}");

    //要确保account是唯一的
    User userOld = userDao.selectByAccount(user.getAccount());
    if(userOld != null) {
      LOG.info("UserController.register.account is used. account:" + user.getAccount());
      return JacksonUtils.toJson("该用户名已被注册过了！！！");
    }

    //要确保手机号唯一
    User userOld2 = userDao.selectByPhone(user.getPhone());
    if(userOld2 != null) {
      LOG.info("UserController.register.account is used. account:" + user.getAccount());
      return JacksonUtils.toJson("该手机号已被注册过了！！！");
    }

    int result = userService.createUser(user);
    if (result != 1) {
      LOG.error("UserController.register.createUser Failed!!!");
      return RetJacksonUtil.resultWithFailed(ErrorCodeEnum.UNKNOWN_ERROR);
    }

    //用户注册成功后，给用户发送消息
    //首先获取用户的id
    User userRegis = userDao.selectByAccount(user.getAccount());
    long userId = userRegis.getId();
    int resultMsg = messageService.createMsg(userId, "欢迎使用【全名快递】", "全民速递软件是天涯网络科技有限公司设计的一款联系全民的物品运送软件。旨在利用人们的出行，同城或跨城地运送物品至目的地，带给有运送需求者便利的同时使出行者获利。不依赖快递公司，出行者自由选择接单使得全民速递软件相对于传统快递尤其是跨区域快递有速度更快，成本更低的明显优势，便民利民，服务于大众生活，前景广阔。", true);
    if(resultMsg != 1) {
      LOG.error("UserController.register.sendMsg ERROR");
    }
    return JacksonUtils.toJson("注册成功");
  }

  @RequestMapping("/test")
  @ResponseBody
  public String test(@RequestParam("account") String account,
                     @RequestParam("password") String password) {
    LOG.info("UserCOntroller.test.account: " + account);
    User user = new User();
    user.setAccount(account);
    user.setPassword(password);
    int result = userDao.test(user);
    return RetJacksonUtil.resultOk();
  }

  /**
   * 获取认证用户的评分相关信息
   * 通过userId--》task--》orderId--》order--》score
   * 每一个task对应一个order
   * @return
   */
  @RequestMapping("/score")
  @ResponseBody
  public String scoreInfo() {
    long userId = holder.getUserId();
    Map<String, Object> info = userService.commentInfo(userId);
    LOG.info("UserController.getUserScoreInfo : " + info);
    String result = JacksonUtils.toJson(info);
    return result;
  }

  @RequestMapping("/sendCode")
  @ResponseBody
  public String sendCode(@RequestParam("phone") long phone) {
    Random random = new Random();
    int code =  random.nextInt(999999);
    //将产生的验证码放入到session中
    holder.setAttribute(String.valueOf(phone), code);
    SmsUtil.sendCode(phone, "用户", code);
    LOG.info("UserController.register.sendCode.{ phone=" + phone + ", code=" + code +"}");
    return RetJacksonUtil.resultOk();
  }

  @RequestMapping("/toVip")
  @ResponseBody
  public String toVip(User user) {
    LOG.info("UserController.toUser. user : " + user.toString());
    long userId = holder.getUserId();
    user.setVip(true);
    user.setId(userId);
    //检验身份证号和姓名是否一致,且在数据库中是否唯一
    //TODO

    //检查银行卡和手机号
    //TODO

    int result = userService.updateUser(user);
    if(result != 1) {
      LOG.error("UserController.toVip.ERROR user:" + user.toString());
    }
    //申请成功后，将hostholder信息修改
    holder.setVip(true);
    return JacksonUtils.toJson("申请成功");
  }

  @RequestMapping(value="/userInfo",method= RequestMethod.POST,produces="text/html;charset=UTF-8")
  @ResponseBody
  public String userInfo() {
    long userId = holder.getUserId();
    User user = userService.getUser(userId);
    LOG.info("UserController.userInfo.user:" + user.toString());
    return JacksonUtils.toJson(user);
  }
}
