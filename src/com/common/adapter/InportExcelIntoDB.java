package com.common.adapter;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.bcel.generic.CALOAD;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.common.utils.CalendarUtil;
import com.common.utils.MathUtil;
import com.common.utils.StringUtils;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;

public class InportExcelIntoDB {
	/**
	 * lxb excel数据导入数据库
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		File file = new File("D:\\work\\www\\lqt\\src\\com\\common\\adapter\\test2.xls");
		String[][] result = getData(file, 0);

		int rowLength = result.length;

		for (int i = 0; i < rowLength; i++) {

			for (int j = 0; j < result[i].length; j++) {
				
				
				System.out.print(result[i][j] + "\t\t");

			}

			System.out.println();

		}
	}

	/**
	 * 
	 * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
	 * 
	 * @param file
	 *            读取数据的源Excel
	 * 
	 * @param ignoreRows
	 *            读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
	 * 
	 * @return 读出的Excel中数据的内容
	 * 
	 * @throws FileNotFoundException
	 * 
	 * @throws IOException
	 */

	public static String[][] getData(File file, int ignoreRows)

	throws FileNotFoundException, IOException {

		List<String[]> result = new ArrayList<String[]>();

		int rowSize = 0;

		BufferedInputStream in = new BufferedInputStream(new FileInputStream(

		file));

		// 打开HSSFWorkbook
		// HSSFWorkbook:是操作Excel2003以前（包括2003）的版本，扩展名是.xls
		// XSSFWorkbook:是操作Excel2007的版本，扩展名是.xlsx
		POIFSFileSystem fs = new POIFSFileSystem(in);

		HSSFWorkbook wb = new HSSFWorkbook(fs);

		HSSFCell cell = null;
		AoJianDataBean bean;
		//sheet頁
		for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {

			HSSFSheet st = wb.getSheetAt(sheetIndex);
			
			bean = new AoJianDataBean();
			bean.setZyAoJianGrainNum("402881eb4ee20f04014ee21173770002");
			// 第一行为厫间数据，取基本数据
				
			for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
				
				HSSFRow row = st.getRow(rowIndex);

				if (row == null) {

					continue;
				}
				//基本信息塞进去
				if(rowIndex==0){
					for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
						cell = row.getCell(columnIndex);
						if(columnIndex==1){
							bean.setAoJianTem(MathUtil.getFormatData(cell.getNumericCellValue(), 1));
						}
						else if(columnIndex==3){
							bean.setAoJianhumidity(MathUtil.getFormatData(cell.getNumericCellValue(), 1));
						}
						else if(columnIndex==5){
							bean.setOuterTem(MathUtil.getFormatData(cell.getNumericCellValue(), 1));
						}
						else if(columnIndex==7){
							bean.setOuterHumidity(MathUtil.getFormatData(cell.getNumericCellValue(), 1));
						}
						else if(columnIndex==9){
							Date date = cell.getDateCellValue();
							String dataStr = CalendarUtil.formatStr(date, CalendarUtil.DATE_FORMAT_MODE4);
							try {
								Date fmtDate = CalendarUtil.formatDate(dataStr, CalendarUtil.DATE_FORMAT_MODE4);
								bean.setStartDate(fmtDate);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
							continue;
						}
					}
//					bean = ServiceManager.getAoJianBlockService().save(bean);
					continue;
				}
				//第二行 也都是垃圾数据   不要
				if(rowIndex==1){
					continue;
				}
				int tempRowSize = row.getLastCellNum() + 1;

				if (tempRowSize > rowSize) {

					rowSize = tempRowSize;

				}

				String[] values = new String[rowSize];

				Arrays.fill(values, "");

				boolean hasValue = false;
				//单元格数据
				for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {

					String value = "";

					cell = row.getCell(columnIndex);

					if (cell != null) {

						// 注意：一定要设成这个，否则可能会出现乱码

						//cell.setEncoding(HSSFCell.ENCODING_UTF_16);

						switch (cell.getCellType()) {

						case HSSFCell.CELL_TYPE_STRING:

							value = cell.getStringCellValue();

							break;

						case HSSFCell.CELL_TYPE_NUMERIC:

							if (HSSFDateUtil.isCellDateFormatted(cell)) {

								Date date = cell.getDateCellValue();

								if (date != null) {

									value = new SimpleDateFormat("yyyy-MM-dd")

									.format(date);

								} else {

									value = "";

								}

							} else {
								value = MathUtil.getFormatData(cell.getNumericCellValue(), 1) + "";
							}

							break;

						case HSSFCell.CELL_TYPE_FORMULA:

							// 导入时如果为公式生成的数据则无值

							if (!cell.getStringCellValue().equals("")) {

								value = cell.getStringCellValue();

							} else {

								value = cell.getNumericCellValue() + "";

							}

							break;

						case HSSFCell.CELL_TYPE_BLANK:

							break;

						case HSSFCell.CELL_TYPE_ERROR:

							value = "";

							break;

						case HSSFCell.CELL_TYPE_BOOLEAN:

							value = (cell.getBooleanCellValue() == true ? "Y"

							: "N");

							break;

						default:

							value = "";

						}

					}

					if (columnIndex == 0 && value.trim().equals("")) {

						break;

					}
					
					values[columnIndex] = rightTrim(value);

					hasValue = true;

				}

				if (hasValue) {

					result.add(values);

				}

			}
			
			String[][] returnArray = new String[20][13];

			for (int i = 0; i < returnArray.length; i++) {

				returnArray[i] = (String[]) result.get(i);
			}
			Set<SensorDataBean> set = new HashSet<SensorDataBean>();
			int rowLength = returnArray.length;
			int k = 0;
			int rowIndex = 0;
			for (int i = 0; i < rowLength; i++) {  //row
				for (int j = 0; j < returnArray[i].length; j++) { //column
					if(StringUtils.isEmpty(returnArray[i][j])){
						continue;
					}
					SensorDataBean sensorBean = new SensorDataBean();
					String sensorIndex = "";
					sensorIndex = (i+1)%5+","+j+","+k;  //(i,j,k)
					sensorBean.setSensorIndex(sensorIndex);
					sensorBean.setOrderIndex(rowIndex++);
					sensorBean.setTemperature(Double.parseDouble(returnArray[i][j]));
					sensorBean.setAoJianDataId(bean.getId());
					set.add(sensorBean);
				}
				if((i+1)%5==0){
					k = k+1;
				}
				System.out.println();
			}
			//bean.setSensors(set);
			ServiceManager.getAoJianBlockService().save(bean);
		}

		in.close();


		return null;

	}

	/**
	 * 
	 * 去掉字符串右边的空格
	 * 
	 * @param str
	 *            要处理的字符串
	 * 
	 * @return 处理后的字符串
	 */

	public static String rightTrim(String str) {

		if (str == null) {

			return "";

		}

		int length = str.length();

		for (int i = length - 1; i >= 0; i--) {

			if (str.charAt(i) != 0x20) {

				break;

			}

			length--;

		}

		return str.substring(0, length);

	}

}