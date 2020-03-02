package utils;

import org.jsoup.Jsoup;

public class ResponseParserUtil {

    public String getToken(String response) {
        return Jsoup.parse(response)
                .head()
                .getElementsByTag("script")
                .last().toString()
                .split("\"")[1];
    }
}
