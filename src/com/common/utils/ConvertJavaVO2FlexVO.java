package com.common.utils;


import java.io.BufferedWriter;  
import java.io.File;  
import java.io.FileWriter;  
import java.io.IOException;  
import java.lang.reflect.Field;  
import java.util.Map;  
  
public class ConvertJavaVO2FlexVO {  
    private static final String[] simpleJavaTypeName = {"String", "Date", "BigDecimal", "Decimal", "Double",   
        "Long", "long", "Integer", "int", "Boolean", "boolean"};  
    private static final String[] simpleFlexTypeName = {"String", "Date", "Number", "Number", "Number",   
        "Number", "Number", "int", "int", "boolean", "boolean"};  
  
    private static final String[] complexJavaTypeName = {"java.util.List", "java.util.Collection"};  
    private static final String[] complexFlexTypeName = {"IList", "ICollectionView"};  
    private static final String[] complexFlexImportName = {"mx.collections.IList", "mx.collections.ICollectionView"};  
      
    private static String getSimpleTypeName(Class c) {  
        String simpleTypeName = c.getSimpleName();  
        String result = null;  
        for (int i = 0; i < simpleJavaTypeName.length; i++) {  
            if (simpleJavaTypeName[i].equals(simpleTypeName)) {  
                result = simpleFlexTypeName[i];  
                break;  
            }                     
        }  
        return result;  
    }  
  
    private static int getComplexJavaTypeIndex(String typeName) {  
        int result = -1;  
        for (int i = 0; i < complexJavaTypeName.length; i++) {  
            if (complexJavaTypeName[i].equals(typeName)) {  
                result = i;  
                break;  
            }                     
        }  
        return result;        
    }     
      
    private static String getComplexTypeName(Class c) {  
        String typeName = c.getName();  
        int index = getComplexJavaTypeIndex(typeName);  
        if (index > -1)  
            return complexFlexTypeName[index];  
        return null;  
    }  
  
    // 鏍规嵁java绫诲璞＄殑绫诲瀷杩斿洖vo绫诲瀷  
    @SuppressWarnings("unchecked")  
    public static String getClassType(Class c) {  
        String result = getSimpleTypeName(c);  
        if (judgeNotEmptyStr(result))  
            return result;  
        result = getComplexTypeName(c);  
        if (judgeNotEmptyStr(result))  
            return result;  
        return "*";// 鍏跺畠绫诲瀷鐨勮缃负鏈煡绫诲瀷  
    }  
  
    // 閲嶅c瀛楃count娆★紝鐢ㄤ簬鏍煎紡鍖栫敓鎴愮殑as鏂囦欢  
    public static String repeat(String c, int count) {  
        StringBuffer strBuf = new StringBuffer();  
        for (int i = 0; i < count; i++) {  
            strBuf.append(c);  
        }  
        return strBuf.toString();  
    }  
  
    /** 
     * 鐢熸垚FLex POJO 
     *  
     * @param pojoName 
     *            java POJO鐨勫悕绉�
     * @param packageName 
     *            Flex鍖呯殑鍚嶇О 
     * @param folder 
     *            Flex鍖呮墍鍦ㄧ殑璺緞 
     * @throws ClassNotFoundException 
     * @throws IOException 
     */  
    @SuppressWarnings("unchecked")  
    public static void generateAsFile(String pojoName, String packageName,  
            String folder) throws ClassNotFoundException, IOException {  
        Class c = Class.forName(pojoName);  
        Field[] fields = c.getDeclaredFields();  
  
        // as鐨剉o瀵硅薄鍚嶇О缁撳熬鍔犱笂VO鏍囧織  
        File f = new File(getVOFileName(folder, packageName, c));  
        BufferedWriter bw = new BufferedWriter(new FileWriter(f));  
        StringBuffer contentBuf = new StringBuffer();  
        createPackageName(packageName, c, contentBuf);  
        createImport(fields, contentBuf);  
        createBindInfo(pojoName, contentBuf);  
  
        createClassHeader(c, contentBuf);  
  
        createProperites(fields, contentBuf);  
        contentBuf.append("\n");  
        createEmptyConstructor(c, contentBuf);  
  
        createGetSetFunction(fields, contentBuf);  
        contentBuf.append(genTabChars());  
        contentBuf.append("}\n");  
        contentBuf.append("}");  
        bw.write(contentBuf.toString());  
        bw.close();  
    }  
  
    private static void createImport(Field[] fields, StringBuffer strBuf) {  
        strBuf.append("\n");  
        // 鍐欏睘鎬� 
        for (int i = 0; i < fields.length; i++) {  
            Class fieldType = fields[i].getType();  
            int index =  getComplexJavaTypeIndex(fieldType.getName());  
            if (index > -1) {  
                strBuf.append(genTabChars());                 
                strBuf.append("import ");  
                strBuf.append(complexFlexImportName[index]);  
                strBuf.append(";\n");  
            }                         
        }  
        strBuf.append("\n");  
          
    }  
      
    private static void createProperites(Field[] fields, StringBuffer strBuf) {  
        // 鍐欏睘鎬� 
        for (int i = 0; i < fields.length; i++) {  
            Class fieldType = fields[i].getType();  
            String typeName = getClassType(fieldType);  
            strBuf.append(genFunctionTabChars());  
            strBuf.append("private var _");  
            strBuf.append(fields[i].getName());  
            strBuf.append(":");  
            strBuf.append(typeName);  
            strBuf.append(";\n");  
        }  
    }  
  
    private static void createGetSetFunction(Field[] fields,  
            StringBuffer contentBuf) {  
        // 鍐�setter/getter 鏂规硶  
        for (int i = 0; i < fields.length; i++) {  
            Class fieldType = fields[i].getType();  
            String typeName = getClassType(fieldType);  
            createSetFunction(fields, contentBuf, i, typeName);  
            createGetFunction(fields, contentBuf, i, typeName);  
  
        }  
    }  
  
    private static void createClassHeader(Class c, StringBuffer contentBuf) {  
        // 鍐欑被  
        contentBuf.append(genTabChars());  
        contentBuf.append("public class ");  
        contentBuf.append(c.getSimpleName());  
        contentBuf.append("VO\n");  
        contentBuf.append(genTabChars());  
        contentBuf.append("{\n");  
    }  
  
    private static void createEmptyConstructor(Class c, StringBuffer strBuf) {  
        // 鍐欑┖鐨勬瀯閫犲嚱鏁� 
        strBuf.append(genFunctionTabChars());  
        strBuf.append("public function ");  
        strBuf.append(c.getSimpleName());  
        strBuf.append("VO(){}\n\n");  
    }  
  
    private static void createFolder(String folderName) {  
        try {  
            File myPath = new File(folderName);  
            if (!myPath.exists()) {  
                myPath.mkdirs();  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
  
    private static String getVOFileName(String folder, String packageName,  
            Class c) {  
        String fd = folder;  
        if (judgeNotEmptyStr(fd)) {  
            if (!folder.endsWith(File.separator))  
                fd += File.separator;  
        }  
        String p1 = packageName;  
        if (!judgeNotEmptyStr(packageName))  
            p1 = c.getPackage().getName();  
        fd += p1.replace('.', File.separatorChar) + File.separator;  
        createFolder(fd);  
        return fd + c.getSimpleName() + "VO.as";  
    }  
  
    private static boolean judgeNotEmptyStr(String value) {  
        return (null != value) && (value.length() > 0);  
    }  
  
    private static void createGetFunction(Field[] fields, StringBuffer strBuf,  
            int i, String typeName) {  
        // getter  
        strBuf.append(genFunctionTabChars());  
        strBuf.append("public function get ");  
        strBuf.append(fields[i].getName());  
        strBuf.append("():");  
        strBuf.append(typeName);  
        strBuf.append("{\n");  
        strBuf.append(genContentTabChars());  
        strBuf.append("return this._");  
        strBuf.append(fields[i].getName());  
        strBuf.append(";\n");  
        genFunctionEnd(strBuf);  
    }  
  
    private static void genFunctionEnd(StringBuffer strBuf) {  
        strBuf.append(genFunctionTabChars() + "}\n\n");  
    }  
  
    private static void createSetFunction(Field[] fields, StringBuffer strBuf,  
            int i, String typeName) {  
        // setter  
        strBuf.append(genFunctionTabChars());  
        strBuf.append("public function set ");  
        strBuf.append(fields[i].getName());  
        strBuf.append("(value:");  
        strBuf.append(typeName);  
        strBuf.append("):void{\n");  
        strBuf.append(genContentTabChars());  
        strBuf.append("this._");  
        strBuf.append(fields[i].getName());  
        strBuf.append(" = value;\n");  
        genFunctionEnd(strBuf);  
    }  
  
    private static String getCountTabChars(int count) {  
        StringBuffer strBuff = new StringBuffer();  
        for(int i = 0; i < count; i++)  
        {  
            strBuff.append(genTabChars());  
        }  
        return strBuff.toString();  
          
    }  
    private static String genContentTabChars() {  
        return getCountTabChars(3);  
    }  
  
    private static String genFunctionTabChars() {  
        return getCountTabChars(2);  
    }  
  
    private static void createBindInfo(String pojoName, StringBuffer strBuf) {  
        // 鍐橞ind澶� 
        strBuf.append(genTabChars());  
        strBuf.append("[Bindable]\n");  
        strBuf.append(genTabChars());  
        strBuf.append("[RemoteClass(alias=\"");  
        strBuf.append(pojoName);  
        strBuf.append("\")]\n");  
    }  
  
    private static String genTabChars() {  
        return repeat(" ", 4);  
    }  
  
    private static void createPackageName(String packageName, Class c,  
            StringBuffer strBuf) {  
        // 鍖呭悕锛屾病鏈夎缃寘鍚嶅氨鍙栧拰java pojo涓�牱鐨勫寘鍚� 
        if ((null != packageName) && (packageName.trim().length() > 1)) {  
            strBuf.append("package " + c.getPackage().getName() + "\n{\n");  
        } else {  
            strBuf.append("package " + packageName + "\n{\n");  
        }  
    }  
  
    // 鐢熸垚鐨勪富绋嬪簭  
    public static void main(String[] args) throws ClassNotFoundException,  
            IOException {  
        String[] pojos = { "com.hibernate.sernsorInfo.domain.ArrangementDataBean" };  
  
        for (int i = 0; i < pojos.length; i++) {  
            ConvertJavaVO2FlexVO.generateAsFile(pojos[i],  
                    "com.vo",  
                    "G:\\code\\lqt\\src");  
        }  
  
    }  
  
}  
