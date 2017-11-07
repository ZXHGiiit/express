<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap Core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <title> Clear User Information</title>
</head>

<body>
<h1>User Setting</h1>
<hr>
<div>
    <h2>Clear Redis</h2>
    <div id="fun1">
        <h3>手动指定key</h3>

        输入RedisArea：<input type="text" id="redisArea1" placeholder="Enter Redis Area"/>
        输入 key：<input type="text" id="redisKey1" placeholder="Enter Key Info"/>
        <br>
        <button type="button" onclick="clearUser('redisArea1','redisKey1')" id="button1">Clear
            Redis Info
        </button>
        <button type="button" onclick="getUserInfo('redisArea1','redisKey1')">查看Info</button>
    </div>
    <br><br>
    <div id="fun2">
        <h3>下拉框选择Area</h3>
        <select name="chooseArea" id="redisArea2">
            <option value="homethy_agent_has_site_">HOMETHY_SITE_AGENT_HAS_SITE</option>
            <option value="homethy_id_to_user_">HOMETHY_ID_TO_USER</option>
            <option value="homethy_id_to_ticket_">HOMETHY_ID_TO_TICKET</option>
            <option value="homethy_ticket_to_id">HOMETHY_TICKET_TO_ID</option>
            <option value="homethy_id_to_secret_key_">HOMETHY_ID_TO_SECRET_KEY</option>
            <option value="homethy_secret_key_to_id_">HOMETHY_SECRET_KEY_TO_ID</option>
            <option value="homethy_id_to_session_key_">HOMETHY_ID_TO_SESSION_KEY</option>
            <option value="homethy_session_key_to_id_">HOMETHY_SESSION_KEY_TO_ID</option>
            <option value="homethy_session_key_to_secret_key_">HOMETHY_SESSION_KEY_TO_SECRET_KEY
            </option>
            <option value="homethy_secret_key_to_session_key_">HOMETHY_SECRET_KEY_TO_SESSION_KEY
            </option>
            <option value="homethy_id_to_verify_code_">HOMETHY_ID_TO_VERIFY_CODE</option>
            <option value="homethy_id_to_forget_verify_code_">HOMETHY_ID_TO_FORGET_VERIFY_CODE
            </option>
            <option value="homethy_id_to_activate_mail_num_">HOMETHY_ID_TO_ACTIVATE_MAIL_NUM
            </option>
            <option value="homethy_user_id_to_user_preference">HOMETHY_USER_ID_TO_USER_PREFERENCE
            </option>
            <option value="homethy_sign_state_to_session_">HOMETHY_SIGN_STATE_TO_SESSION</option>
            <option value="homethy_ticket_t_">HOMETHY_TICKET_T</option>
            <option value="homethy_ticket_p_">HOMETHY_TICKET_P</option>
            <option value="homethy_ticket_super_admin_t_">HOMETHY_TICKET_SUPER_ADMIN_T</option>
            <option value="homethy_user_reset_pwd_mail_">HOMETHY_USER_RESET_PWD_MAIL</option>
            <option value="homethy_user_reset_pwd_web_">HOMETHY_USER_RESET_PWD_WEB</option>
            <option value="homethy_user_zonetime_">HOMETHY_USER_ZONETIME</option>
            <option value="homethy_user_list_">HOMETHY_LEAD_LIST</option>
            <option value="homethy_mail_ignore_id_list_">HOMETHY_MAIL_IGNORE_ID_LIST</option>
            <option value="homethy_mail_ignore_id_set_">HOMETHY_MAIL_IGNORE_ID_SET</option>
            <option value="homethy_site_">HOMETHY_SITE</option>
            <option value="homethy_site_suggestion_code">HOMETHY_SITE_SUGGESTION_CODE</option>
            <option value="homethy_site_to_dialog_virtualuser_">HOMETHY_SITE_TO_DIALOG_VIRTUALUSER
            </option>
            <option value="new_communication_">NEW_COMMUNICATION</option>
            <option value="drip_mail_">DRIP_MAIL</option>
            <option value="common_config_">COMMON_CONFIG</option>
            <option value="homethy_team_id_to_team_authority_">HOMETHY_TEAM_ID_TO_TEAM_AUTHORITY
            </option>
            <option value="homethy_payment_order_lock_">HOMETHY_PAYMENT_ORDER_LOCK</option>
            <option value="homethy_request_for_upgrade_">HOMETHY_REQUEST_FOR_UPGRADE</option>
            <option value="homethy_teammember_id_to_reg_vc_">HOMETHY_TEAMMEMBER_ID_TO_REG_VC
            </option>
            <option value="homethy_crm_lead_routing_hit">HOMETHY_CRM_LEAD_ROUTING_HIT</option>
            <option value="homethy_payment_contract_monthly_charge">
                HOMETHY_PAYMENT_CONTRACT_MONTHLY_CHARGE
            </option>
            <option value="homethy_site_team_id_set">HOMETHY_SITE_TEAM_ID_SITE</option>
            <option value="homethy_frequent_billing_pay_lock_">HOMETHY_FREQUENT_BILLING_PAY_LOCK
            </option>
            <option value="homethy_id_to_finance_passed_verify_">
                HOMETHY_ID_TO_FINANCE_PASSED_VERIFY
            </option>
            <option value="homethy_id_to_finance_verify_code_">HOMETHY_ID_TO_FINANCE_VERIFY_CODE
            </option>
            <option value="homethy_lender_email_tosales_agent_need_bspackage_">
                HOMETHY_LENDER_EMAIL_TOSALES_AGENT_NEED_BSPACKAGE
            </option>
            <option value="homethy_nexmo_vcall_callback_">HOMETHY_NEXMO_VCALL_CALLBACK</option>
            <option value="homethy_nexmo_vsms_quota_count_">HOMETHY_NEXMO_VSMS_QUOTA_COUNT</option>
            <option value="homethy_nexmo_vsms_quota_notify_email_">
                HOMETHY_NEXMO_VSMS_QUOTA_NOTIFY_EMAIL
            </option>
            <option value="homethy_nexmo_vsms_failure_record_">HOMETHY_NEXMO_VSMS_FAILURE_RECORD
            </option>
            <option value="homethy_nexmo_vsms_fakeapi_history_record_">
                HOMETHY_NEXMO_VSMS_FAKEAPI_HISTORY_RECORD
            </option>
            <option value="homethy_nexmo_test_vcall_uuid_">HOMETHY_NEXMO_TEST_VCALL_UUID</option>
            <option value="homethy_nexmo_test_vcall_tonumber_">HOMETHY_NEXMO_TEST_VCALL_TONUMBER
            </option>
            <option value="homethy_nexmo_test_vcall_list_tonumber_">
                HOMETHY_NEXMO_TEST_VCALL_LIST_TONUMBER
            </option>
            <option value="homethy_nexmo_test_vcall_list_currentcount_">
                HOMETHY_NEXMO_TEST_VCALL_LIST_CURRENTCOUNT
            </option>
            <option value="homethy_nexmo_test_vcall_status_">HOMETHY_NEXMO_TEST_VCALL_STATUS
            </option>
            <option value="homethy_nexmo_test_vcall_begin_time_">
                HOMETHY_NEXMO_TEST_VCALL_BEGIN_TIME
            </option>
            <option value="homethy_lead_search_lock_">HOMETHY_LEAD_SEARCH_LOCK</option>
            <option value="brokerage_team">BRKERAGE_TEAM</option>
            <option value="phone_number_to_verify_code_">PHONE_NUMBER_TO_VERIFY_CODE</option>
            <option value="phone_number_to_verify_code_times_">PHONE_NUMBER_TO_VERIFY_CODE_TIMES
            </option>
            <option value="homethy_group_actionplan_lock_">HOMETHY_GROUP_ACTIONPLAN_LOCK</option>
            <option value="homethy_id_to_crmagentinfo_">HOMETHY_ID_TO_CRMAGENTINFO</option>
            <option value="homethy_lead_claim_lock">HOMETHY_LEAD_CLAIM_LOCK</option>
            <option value="homethy_filter_lead_ids">HOMETHY_FILTER_LEAD_IDS</option>
        </select>
        输入 key：<input type="text" id="redisKey2" placeholder="Enter Key Info"/>
        <br>
        <button type="button" onclick="clearUser('redisArea2','redisKey2')" id="button2">Clear
            Redis Info
        </button>
        <button type="button" onclick="getUserInfo('redisArea2','redisKey2')">查看Info</button>
    </div>
    <br>
    <hr>
    <h3>查询信息结果</h3>
    <div id="Info"></div>

    <h2>Reset Password</h2>
    <p style="color:red;">被重置密码的用户，将会被强制退出系统，请谨慎使用</p>
    <div id="fun3">

        输入UserId：<input type="text" id="userId" placeholder="Enter User Id"/><br/>
        输入 pwd：<input type="text" id="password" placeholder="Enter Password"/>
        <br>
        <button type="button" onclick="resetPwd('userId','password')" id="btnResetPwd">Reset
        </button>
    </div>
    <hr>
    <h3>Reset Password 结果</h3>
    <div id="resetResult"></div>
</div>

<!-- jQuery -->
<script src="//cdn.bootcss.com/jquery/1.12.1/jquery.min.js"></script>
<script src="//cdn.bootcss.com/modernizr/2.8.3/modernizr.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/metisMenu/1.1.3/metisMenu.min.js"></script>

<script>
    function clearUser(redisArea, redisKey) {
        var area = document.getElementById(redisArea).value;
        var key = document.getElementById(redisKey).value;
        alert(userkey + "," + email);
        $.ajax({
                   type: "POST",
                   url: "<%=request.getContextPath()%>/agentsite/clearRedis",
                   data: {
                       "redisArea": area,
                       "redisKey": key
                   },
                   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                   dataType: "json",
                   success: function (data) {
                       var jsonData = eval(data);
                       var status = jsonData.status.code;
                       if (status == 0) {
                           alert("Clear Success.");
                       } else {
                           alert("Clear Failed.");
                       }
                   }
               });
    }

    function getUserInfo(redisArea, redisKey) {
        var area = document.getElementById(redisArea).value;
        var key = document.getElementById(redisKey).value;
        $.ajax({
                   type: "POST",
                   url: "<%=request.getContextPath()%>/agentsite/showValue",
                   data: {
                       "redisArea": area,
                       "redisKey": key
                   },
                   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                   dataType: "json",
                   success: function (data) {
                       var jsonData = eval(data);
                       var status = jsonData.status.code;
                       var Info = "";
                       if (status == 0) {
                           var memberInfo = jsonData.data;
                           Info = memberInfo.values + "<br>";
                       } else {
                           Info = "Get Info Failed."
                       }
                       $("#Info").html(Info);
                   }
               });
    }

    function resetPwd(userId, password) {
        var uid = document.getElementById(userId).value;
        var pwd = document.getElementById(password).value;
        $.ajax({
                   type: "POST",
                   url: "<%=request.getContextPath()%>/user/change/passwd",
                   data: {
                       "userId": uid,
                       "newPassword": pwd
                   },
                   contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                   dataType: "json",
                   success: function (data) {
                       var jsonData = eval(data);
                       var status = jsonData.status.code;
                       var Info = jsonData.status.msg;
                       $("#resetResult").html(Info);
                   }
               });
    }

</script>
</body>
</html>