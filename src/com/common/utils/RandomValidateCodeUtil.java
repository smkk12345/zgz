package com.common.utils;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class RandomValidateCodeUtil {
	

	public static final String RANDOMCODEKEY = "RANDOMVALIDATECODEKEY";// 放到session中的key
	private Random random = new Random();
	private String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";// 随机产生的字符串
	//private int width = 80;// 图片宽
	//private int height = 26;// 图片高
	private int lineSize = 40;// 干扰线数量
	private int stringNum = 4;// 随机产生字符数量
	  // 验证码图片的宽度。         
    private int width = 60;         
    // 验证码图片的高度。         
    private int height = 20;         
    // 验证码字符个数         
    private int codeCount = 4;         
    private int x = 0;         
    // 字体高度         
    private int fontHeight;         
    private int codeY;         
    char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',         
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',         
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };  
	/*
	 * 获得字体
	 */
	private Font getFont() {
		return new Font("Fixedsys", Font.CENTER_BASELINE, 18);
	}
	/*
	 * 获得颜色
	 */
	private Color getRandColor(int fc, int bc) {
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc - 16);
		int g = fc + random.nextInt(bc - fc - 14);
		int b = fc + random.nextInt(bc - fc - 18);
		return new Color(r, g, b);
	}
	/**
	 * 生成随机图片
	 */
	public void getRandcode(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		// BufferedImage类是具有缓冲区的Image类,Image类是用于描述图像信息的类
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_BGR);
		Graphics g = image.getGraphics();// 产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操作
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.ROMAN_BASELINE, 18));
		g.setColor(getRandColor(110, 133));
		// 绘制干扰线
		for (int i = 0; i <= lineSize; i++) {
			drowLine(g);
		}
		// 绘制随机字符
		String randomString = "";
		for (int i = 1; i <= stringNum; i++) {
			randomString = drowString(g, randomString, i);
		}
		session.removeAttribute(RANDOMCODEKEY);
		session.setAttribute(RANDOMCODEKEY, randomString);
		System.out.println(randomString);
		g.dispose();
		try {
			ImageIO.write(image, "JPEG", response.getOutputStream());// 将内存中的图片通过流动形式输出到客户端
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**       
     * 初始化验证图片属性       
     */        
    public void initxuan() throws ServletException {         
        // 从web.xml中获取初始信息         
        // 宽度         
        String strWidth ="80";         
        // 高度         
        String strHeight ="30";         
        // 字符个数         
        String strCodeCount = "4";         
        // 将配置的信息转换成数值         
        try {         
            if (strWidth != null && strWidth.length() != 0) {         
                width = Integer.parseInt(strWidth);         
            }         
            if (strHeight != null && strHeight.length() != 0) {         
                height = Integer.parseInt(strHeight);         
            }         
            if (strCodeCount != null && strCodeCount.length() != 0) {         
                codeCount = Integer.parseInt(strCodeCount);         
            }         
        } catch (NumberFormatException e) {         
        }         
        x = width / (codeCount + 1);         
        fontHeight = height - 2;         
        codeY = height - 4;         
    }   
	/**
	* @名称: getRandcodeByYz 
	* @日期：2015-9-21 下午6:35:21
	* @作者： lxb
	* @描述: yuz
	* @参数 @param request
	* @参数 @param response    
	* @返回值 void    
	* @异常
	 */
	public void getRandcodeByYz(HttpServletRequest request,
			HttpServletResponse response) {
		 try {
			 initxuan();
		} catch (Exception e) {
			// TODO: handle exception
		}
		 BufferedImage buffImg = new BufferedImage(width, height,         
	                BufferedImage.TYPE_INT_RGB);         
	        Graphics2D g = buffImg.createGraphics();         
	        // 创建一个随机数生成器类         
	        Random random = new Random();         
	        // 将图像填充为白色         
	        g.setColor(Color.WHITE);         
	        g.fillRect(0, 0, width, height);         
	        // 创建字体，字体的大小应该根据图片的高度来定。         
	        Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);         
	        // 设置字体。         
	        g.setFont(font);         
	        // 画边框。         
	        g.setColor(Color.BLACK);         
	        g.drawRect(0, 0, width - 1, height - 1);         
	        // 随机产生160条干扰线，使图象中的认证码不易被其它程序探测到。         
	        g.setColor(Color.BLACK);         
	        for (int i = 0; i < 10; i++) {         
	            int x = random.nextInt(width);         
	            int y = random.nextInt(height);         
	            int xl = random.nextInt(12);         
	            int yl = random.nextInt(12);         
	            g.drawLine(x, y, x + xl, y + yl);         
	        }         
	        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。         
	        StringBuffer randomCode = new StringBuffer();         
	        int red = 0, green = 0, blue = 0;         
	        // 随机产生codeCount数字的验证码。         
	        for (int i = 0; i < codeCount; i++) {         
	            // 得到随机产生的验证码数字。         
	            String strRand = String.valueOf(codeSequence[random.nextInt(36)]);         
	            // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。         
	            red = random.nextInt(255);         
	            green = random.nextInt(255);         
	            blue = random.nextInt(255);         
	            // 用随机产生的颜色将验证码绘制到图像中。         
	            g.setColor(new Color(red, green, blue));         
	            g.drawString(strRand, (i + 1) * x, codeY);         
	            // 将产生的四个随机数组合在一起。         
	            randomCode.append(strRand);         
	        }         
	        // 将四位数字的验证码保存到Session中。         
	        HttpSession session = request.getSession();         
	        session.setAttribute(RANDOMCODEKEY, randomCode.toString());         
	        // 禁止图像缓存。         
	        response.setHeader("Pragma", "no-cache");         
	        response.setHeader("Cache-Control", "no-cache");         
	        response.setDateHeader("Expires", 0);         
	        response.setContentType("image/jpeg");         
	        // 将图像输出到Servlet输出流中。         
	        ServletOutputStream sos;
			try {
				PrintWriter out = response.getWriter();  
				sos = response.getOutputStream();
				ImageIO.write(buffImg, "jpeg", sos);         
				sos.close();         
			} catch (IOException e) {
				e.printStackTrace();
			}         
	}
	
	/*
	 * 绘制字符串
	 */
	private String drowString(Graphics g, String randomString, int i) {
		g.setFont(getFont());
		g.setColor(new Color(random.nextInt(101), random.nextInt(111), random
				.nextInt(121)));
		String rand = String.valueOf(getRandomString(random.nextInt(randString
				.length())));
		randomString += rand;
		g.translate(random.nextInt(3), random.nextInt(3));
		g.drawString(rand, 13 * i, 16);
		return randomString;
	}
	/*
	 * 绘制干扰线
	 */
	private void drowLine(Graphics g) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(13);
		int yl = random.nextInt(15);
		g.drawLine(x, y, x + xl, y + yl);
	}
	/*
	 * 获取随机的字符
	 */
	public String getRandomString(int num) {
		return String.valueOf(randString.charAt(num));
	}
}
