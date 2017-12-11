package weibo4j.demo;

import weibo4j.http.HttpClient;
import weibo4j.http.Response;
import weibo4j.model.PostParameter;
import weibo4j.model.WeiboException;
import weibo4j.org.json.JSONObject;
import weibo4j.util.WeiboConfig;

public class StatusUpdate {
    private static HttpClient client = new HttpClient();
    private static final String access_token = "2.00IvkYAHNUxjdC8a7fe98ec6bnENtC";
    private static final String screen_name = "芥末小姐a";
    public static void main(String[] args) {
        Response res = null;
        try {
            /*
            res = client.get(
                    WeiboConfig.getValue("baseURL") + "users/show.json",
                    new PostParameter[] { new PostParameter("screen_name",
                            screen_name) }, access_token);
            */
            res = client.post(
                    WeiboConfig.getValue("baseURL") + "statuses/share.json",
                    new PostParameter[] { new PostParameter("status",
                            "https://api.weibo.com/default.html") }, access_token);
        } catch (WeiboException e) {
            e.printStackTrace();
        };

        JSONObject json = null;
        try {
            json = res.asJSONObject();
            System.out.println(json);
        } catch (WeiboException e) {
            e.printStackTrace();
        }
    }

}
