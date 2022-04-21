package common;

import java.util.regex.Pattern;

public class Validate {
    Pattern pattern = Pattern.compile("^\\+*\\d+$");
    public static final String POSITIVE_INTEGERS_REGEX = "^\\+*\\d+$";
    public static final String POSITION_DOUBLE_REGEX = "^\\+*\\d+(\\.\\d+)*$";
    public static final  String CUSTOMER_CODE_REGEX = "^KH-\\d{4}$";
    public static final  String SERVICE_CODE_REGEX = "^DV-\\d{4}$";
    public static final String TELEPHONE_NUMBER_REGEX = "^(090|091|\\(84\\)\\+90|\\(84\\)\\+91)\\d{7}$";
    public static final String ID_CARD_REGEX = "^\\d{9}|\\d{12}$";
    public static final String EMAIL_ADDRESS_REGEX = "^\\w+([.-]?\\w+)*@[a-z]+\\.(\\w+){2,}(\\.\\w{2,3})?";
    public static final String DATE_TIME_REGEX = "^\\d{4}\\-(0[1-9]|1[012])\\-(0[1-9]|[12][0-9]|3[01])$";
    public static final String DATE_TIME_FORMAT_REGEX = "^\\d{4}-\\d{2}-\\d{2}$";

    public static final String DATE_LEAP_YEAR_REGEX = "^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(\\/|-|\\.)" +
            "(?:0?[13-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?" +
            "(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(\\/|-|\\.)" +
            "(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$";
}
