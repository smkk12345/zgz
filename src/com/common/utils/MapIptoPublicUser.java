package com.common.utils;

import java.util.Map;

public class MapIptoPublicUser {
	/**
	 * ipƥ���Ӧ�Ĺ����û� pcj
	 * @param ip
	 * @param  IPConfig
	 * @return String
	 */
	public static String getInitUserByIp(String ip,Map<String, String> IPConfig){
		String template="public2";
		float initSimiliarty=0;
		String resultKey="";
		for(String key:IPConfig.keySet()){
			
			float similarty=getSimilarityRatio(ip,key);
			if(similarty>initSimiliarty){
				initSimiliarty=similarty;
				resultKey=key;
			}
		}
		template=IPConfig.get(resultKey);
	    return template;
	}
	
	/**
	 * �Ƚ������ַ���
	 * @param str
	 * @param  target
	 * @return int
	 */
	public static int compare(String str, String target)
    {
        int d[][];              // ����
        int n = str.length();
        int m = target.length();
        int i;                  // ����str��
        int j;                  // ����target��
        char ch1;               // str��
        char ch2;               // target��
        int temp;               // ��¼��ͬ�ַ�,��ĳ������λ��ֵ������,����0����1
        if (n == 0) { return m; }
        if (m == 0) { return n; }
        d = new int[n + 1][m + 1];
        for (i = 0; i <= n; i++)
        {                       // ��ʼ����һ��
            d[i][0] = i;
        }

        for (j = 0; j <= m; j++)
        {                       // ��ʼ����һ��
            d[0][j] = j;
        }

        for (i = 1; i <= n; i++)
        {                       // ����str
            ch1 = str.charAt(i - 1);
            // ȥƥ��target
            for (j = 1; j <= m; j++)
            {
                ch2 = target.charAt(j - 1);
                if (ch1 == ch2 || ch1 == ch2+32 || ch1+32 == ch2)
                {
                    temp = 0;
                } else
                {
                    temp = 1;
                }
                // ���+1,�ϱ�+1, ���Ͻ�+tempȡ��С
                d[i][j] = min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + temp);
            }
        }
        return d[n][m];
    }

	/**
	 * �����������е����ֵ
	 * @param one
	 * @param two
	 * @param three
	 * @return int
	 */
    public static int min(int one, int two, int three)
    {
        return (one = one < two ? one : two) < three ? one : three;
    }

    /**
	 * ��ȡ�����ַ��������ƶ� 0-1
	 * @param str
	 * @param target
	 * @return int
	 */

    public static float getSimilarityRatio(String str, String target)
    {
        return 1 - (float) compare(str, target) / Math.max(str.length(), target.length());
    }
	
	
	
}
