package com.express.admin.constant;

import java.util.Locale;

/**
 * 中英文网站返回信息枚举类
 */
public enum WebCodeEnum {

    OK(0, "Successful", "成功"),

    // 1默认错误
    UNKNOWN_ERROR(100000, "Server Error", "服务出错"),
    SIG_ERROR(100001, "Sig Error", "签名检验失败"),
    SESSION_ERROR(100002, "Session Error", "会话出错"),
    RETURN_NULL_ERROR(100003, "Return Null", "返回为空"),

    // 1.1 Exception
    EXCEPTION_FIELD_NULL(110001, "Field %s can't be null or empty string. ", "必填信息不能为空"),
    EXCEPTION_FIELD_SCOPE_ERROR(110002, "FIELD %s ", "作用域错误"),
    EXCEPTION_PARA_ERROR(110003, "Pamater %s formate error", "参数格式错误"),

    // 2 登陆
    LOGIN_ACCOUNT_PWD_ERROR(200001, "Your email or password is incorrect", "您输入的账号或密码不正确"),
    LOGIN_GET_TICKET_FAIL(200002, "Set Ticket failed", "设置Ticket失败"),
    LOGIN_NOT_IS_WHITE_ACCOUNT_ERROR(200003, "You account isn't white status", "您不属于白名单用户"),

    VISIT_ADMIN_DOMAIN_ERROR(200004, "Admin domain info error", "域名信息错误"),
    VISIT_ADMIN_NEED_BIND_PHONE(200005, "Need bind your cell phone.", "需要绑定手机号"),

    // 2.1 注册
    REG_EMAIL_FORMATE_ERROR(210001, "Invalid email format", "请输入正确邮箱地址"),
    REG_EMAIL_ALREADY_TAKEN(210002, "Your email has been registered", "您输入的邮箱已注册"),
    REG_PASSWORD_IS_NULL(210003, "Password must between 6 and 20 characters", "密码长度为6-20字符"),
    REG_NAME_TOO_LONG(210004, "Name must be no more than 12 characters", "姓名长度不超过6个汉字"),
    REG_INFO_IS_NULL(210005, "The content can't be blank", "必填信息请补充完整"),
    REG_USER_FAILED(210006, "Register user failed", "注册失败"),
    REG_SOURCETYPE_FAILED(210007, "Register sourceType failed", "注册失败 sourceType错误"),
    REG_USER_NAME_SPLIT_FAILED(210008, "Register user chinese name spell wrong", "中文名格式"),
    REG_USER_AND_LOGIN_FAILED(210011, "Register user or login failed", "注册与登录异常"),


    // 3 收藏
    COLLECT_TYPE_FAILED(300001, "Collect type is failed", "收藏类型错误"),
    COLLECT_LISITNGID_FAILED(300002, "Collect lisitng id isn't exit", "收藏的listingId不存在"),
    COLLECT_PAGENO_FAILED(300003, "Collect lisitng pageNo failed", "分页数量error"),

    //4 lsiting
    LISTING_PAGENO_FAILED(400001, "lisitng pageNo failed", "分页数量error"),
    LISTING_QUICKSEARCH_NULL_ERROR(400002, "quick search listing is null error", "快速搜索的内容为空"),

    //4.1 lsiting
    BLOG_PAGENO_FAILED(401001, "blog pageNo failed", "分页数量error"),
    SEARCH_SUGGEST_IS_NULL(401001, "search suggest is null error", "搜索提示结果为空"),

    AGENT_INFO_ERROR(402001, "agent id is null", "agent id 不存在"),

    // 5- Site
    SITE_SEARCH_TEXT_CAN_NOT_BE_EMPTY(500001, "Search text can't be empty", "搜索内容不能为空"),
    SOCIAL_TYPE_NULL(500002, "social type field is null", "社交类型是空"),
    ADD_SITETYPE_PARAMS_ERROR(500003, "please checkout params", "添加的站点类型错误"),
    USER_NULL_ERROR(500004, "user is null", "用户不存在"),

    SITELIST_PAGE_PARAM_ERROR(500005, "pageNo or displayNum can't < 0", "分页数量显示错误"),

    LAUNCH_STATUS_SETUP_ERROR(500006, "site launch status set up is error!", "站运行状态设置error"),
    TEMPLATE_NULL_ERROR(500007, "template style is null", "模板样式为空"),
    TEMPLATE_IS_ERROR(500008, "template is null", "模板为空"),

    SITE_TITLE_NULL_ERROR(500009, "site title is null", "标题为空"),
    SITE_TAGLINE_NULL_ERROR(500010, "site tagline is null", "tagline 为空"),
    SITE_LOGO_NAME_NULL_ERROR(500011, "site logoname is null", "logo name为空"),
    EMAIL_ADDRESS_FORMAT_ERROR(500012, "email address error", "邮件地址格式错误"),
    SITE_SOURCE_ERROR(500013, "site source error", "站点来源error"),
    TRACKING_CONTENT_NULL_ERROR(500014, "lead tracking content is null error", "tracking 内容为空"),

    LEAD_ACTION_TYPY_ERROR(500014, "dialog action type error", "行为类型error"),

    SETTING_PASSWORD_ERROR(500015, "Password error", "密码错误"),

    // 51-Search error
    SAVE_SEARCH_SUCCESS(510000,"Your search has been saved successfully.", "保存成功"),
    SAVE_SEARCH_PARAM_ERROR(510001,"error, save search name or condition is empty", "save search输入参数为空"),
    SAVE_SEARCH_SAME_SAVE_NAME(510002,"error, save search name exist", "save search name 已经存在"),
    SAVE_SEARCH_SAME_SEARCH_CONDITION(510003,"error, save search condition exist", "save search condition 已经存在"),
    SAVE_SEARCH_PAGENO_FAILED(510004, "save search listing pageNo error", "save search分页数量错误"),

    //6 广告投放系统相关错误码
    SCHEDULE_DATE_ERROR(600001, "date is error.", "Schedule日期参数错误"),
    SCHEDULE_BUDGET_ERROR(600002, "Schedule ad budget is less than 0.", "Schedule广告预算不能小于0"),
    SCHEDULE_CURRENT_TARGET_ERROR(600003, "Schedule current target is less than 0.", "Schedule 当前目标lead数不能小于0"),
    ADGROUP_SOURCE_ERROR(600004, "Source is not known.", "广告主来源找不到"),
    ADGROUP_LIST_IS_NULL(600005, "get adgroupList is null.", "拉取广告主列表失败"),
    ADGROUP_PARAMETER_ERROR(600006, "page or pagesize error.", "page或者pageSize参数错误"),
    AREASTR_TO_JSONARRAY_ERROR(600007, "parse json str error.", "解析json字符串错误"),
    ADGROUP_IDS_ERROR(600008, "ids is null.", "ids为空"),
    ADGROUP_ID_PARSE_ERROR(600009, "parse idstr error.", "id字符串转为long错误"),
    ;

    private int errorCode; // 错误码

    private String enErrorMsg; // 英文错误信息

    private String zhErrorMsg; // 中文错误信息

    private WebCodeEnum(int errorCode, String enErrorMsg ,String zhErrorMsg){
        this.errorCode = errorCode;
        this.enErrorMsg = enErrorMsg;
        this.zhErrorMsg = zhErrorMsg;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getEnErrorMsg() {
        return enErrorMsg;
    }

    public void setEnErrorMsg(String enErrorMsg) {
        this.enErrorMsg = enErrorMsg;
    }

    public String getZhErrorMsg() {
        return zhErrorMsg;
    }

    public void setZhErrorMsg(String zhErrorMsg) {
        this.zhErrorMsg = zhErrorMsg;
    }

    // 根据中英文获取相应的中英文错误信息
    public String getErrorMsg(Locale locale) {
        if (locale.equals(Locale.CHINESE) || locale.equals(Locale.CHINA ) || locale.equals(Locale.TAIWAN) || locale.equals(Locale.PRC) || locale.equals(Locale.SIMPLIFIED_CHINESE) || locale.equals(Locale.TRADITIONAL_CHINESE) ) {
            return zhErrorMsg;
        } else {
            return enErrorMsg;
        }
    }

}
