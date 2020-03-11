package com.dongtech.utils.dog;

/** @auther: jiangtao @Date: 2020/01/16/13:53 加密狗工具类 */
public class DogUtil {

  /**
   * 登录操作；
   *
   * @return
   */
  public static boolean login() {
    long feature = Aladdin.Hasp.HASP_DEFAULT_FID;

    String vendorCode =
        "DIhKktsPeS8ZFp6yViRbT1gNLomjTJDPDQyE0GDkT828QHxrwpfmrjXSz13pULxTQnre/PUGvYWcscZJ"
            + "+VCbj0iQ4oy193gA+T83+Vr8AGtb7JjJkQViZloLShME3qZ87+xOCKFB89IIXTACH0b3z1q89s8EExJ6"
            + "wygxnMTdYmH5t8nf55kmp0mgG6x3fxtco3NZ+Q9/lEDd9YKpmNL78RN4JZVNVRUA4ZWOQJ4cbRqHE0wM"
            + "QDlf0AmgvQkXoW8Dl+y3ExHbmTTAnt4MiwD5aXiliwfyQ5wCALcs9Jk2YcGR8sRd5HyyLPEmAzhCRAoF"
            + "TytwQD7fc+moo0LzOkKh6iMQaSdoVbeQ9HvhjnNohgEbT2ZQnTW83WmA/rWAB4OzhnBJIisNDBQXaWAj"
            + "oasDstUjyoO1Qm9rxp6U/6a4qyTxhkC0tT6xvb1guBsu9GGVgoALs3PNJz1VNKH1a+/D1t/B4RZfk++e"
            + "8Rl9f4eVRzICVE7n2MLnuPDSw5YzRqm9tYZOw2stD3S/JPrsz269l1cu+vQxieAiNijJNHULafMdtdB9"
            + "J0e/DIK5eMErqoXfLirE3sNFLSnKrN8ENWXjFMqqgClEWm0VJvo5oq7UNazX/+sZrE8+XK/FNvHRJxTk"
            + "X7sS9QcS8gIhiLrbpC63wi+brHSlfVIL85HVAU0e+cQ9imf8sIo8+5782/gp8Mk4QGUpKEL7vWcTmZWb"
            + "rw6VVuzueiUyePslDIZQGt25Lsc1KwDv3lHPhQDoXOSn4JtpS/dMGV08b4l+U2LBEBwnFA2YTqejTSD2"
            + "uHrWLv9NrVoNjFaR22RGzlya8uR6Cg+T2wSvVCeRRG99XEJa95/gfHJMAxRWzi4Yhxsr0ctfQVvJlDY+"
            + "HW1DBKjnEZYYdJmKkxXXLy3iAg//3m/fPbKZP3sdPdg6yO2r93vYi8reVYyMEkJdYkhIgldbDxRCIzk2"
            + "OqhpxAL+oayGz9JdwwWxEA==";

    Aladdin.Hasp hasp = new Aladdin.Hasp(feature);

    hasp.login(vendorCode);

    int status = hasp.getLastError();

    if (Aladdin.HaspStatus.HASP_STATUS_OK == status) {
      /*handle error*/
      return true;
    } else {
      return false;
    }
  }

  //  public static void main(String[] args) {
  //    System.out.println(login() + ">>>");
  //  }
}
