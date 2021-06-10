package eu.morozik.springMVC.Util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Parser {
    public static List<Long> parserCarId(String str_id) {
        int i = 0;
        List<Long> longs = new ArrayList<>();
        Pattern pattern = Pattern.compile("id=\\d+");
        Matcher matcher = pattern.matcher(str_id);
        while (matcher.find()) {
            i++;
        }
        String[] arrId = new String[i];
        i = 0;
        Matcher matcher2 = pattern.matcher(str_id);
        while (matcher2.find()) {
            arrId[i] = "";
            arrId[i] = str_id.substring(matcher2.start(), matcher2.end());//id=3
            i++;

        }
        for (String id : arrId) {
            Pattern pattern3 = Pattern.compile("id=");
            Matcher matcher3 = pattern3.matcher(id);
            longs.add(Long.valueOf(matcher3.replaceAll("")));
        }

        for (long a : longs) {
            System.out.println(a);
        }
        return longs;
    }

}
