/*The MIT License (MIT)

Copyright (c) 2014 https://github.com/kayalshri/

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.*/

(function($){
        $.fn.extend({
            tableExport: function(options,fileName) {
                var defaults = {
						separator: ',',
						ignoreColumn: [],
						tableName:'yourTableName',
						type:'csv',
						pdfFontSize:14,
						pdfLeftMargin:20,
						escape:'true',
						htmlContent:'false',
						consoleLog:'false'
				};
                
				var options = $.extend(defaults, options);
				var el = this;
				
				if(defaults.type == 'csv' || defaults.type == 'txt'){
				
					// Header
					var tdData ="";
					$(el).find('thead').find('tr').each(function() {
					tdData += "\n";					
						$(this).filter(':visible').find('th').each(function(index,data) {
							if ($(this).css('display') != 'none'){
								if(defaults.ignoreColumn.indexOf(index) == -1){
									tdData += '"' + parseString($(this)) + '"' + defaults.separator;									
								}
							}
							
						});
						tdData = $.trim(tdData);
						tdData = $.trim(tdData).substring(0, tdData.length -1);
					});
					
					// Row vs Column
					$(el).find('tbody').find('tr').each(function() {
					tdData += "\n";
						$(this).filter(':visible').find('td').each(function(index,data) {
							if ($(this).css('display') != 'none'){
								if(defaults.ignoreColumn.indexOf(index) == -1){
									tdData += '"'+ parseString($(this)) + '"'+ defaults.separator;
								}
							}
						});
						//tdData = $.trim(tdData);
						tdData = $.trim(tdData).substring(0, tdData.length -1);
					});
					
					//output
					if(defaults.consoleLog == 'true'){
						console.log(tdData);
					}
					
					var base64data = "base64," + $.base64({data:tdData,type:0});
					window.open('data:application/'+defaults.type+';filename=exportData;' + base64data);
				}else if(defaults.type == 'sql'){
				
					// Header
					var tdData ="INSERT INTO `"+defaults.tableName+"` (";
					$(el).find('thead').find('tr').each(function() {
					
						$(this).filter(':visible').find('th').each(function(index,data) {
							if ($(this).css('display') != 'none'){
								if(defaults.ignoreColumn.indexOf(index) == -1){
									tdData += '`' + parseString($(this)) + '`,' ;									
								}
							}
							
						});
						tdData = $.trim(tdData);
						tdData = $.trim(tdData).substring(0, tdData.length -1);
					});
					tdData += ") VALUES ";
					// Row vs Column
					$(el).find('tbody').find('tr').each(function() {
					tdData += "(";
						$(this).filter(':visible').find('td').each(function(index,data) {
							if ($(this).css('display') != 'none'){
								if(defaults.ignoreColumn.indexOf(index) == -1){
									tdData += '"'+ parseString($(this)) + '",';
								}
							}
						});
						
						tdData = $.trim(tdData).substring(0, tdData.length -1);
						tdData += "),";
					});
					tdData = $.trim(tdData).substring(0, tdData.length -1);
					tdData += ";";
					
					//output
					//console.log(tdData);
					
					if(defaults.consoleLog == 'true'){
						console.log(tdData);
					}
					
					var base64data = "base64," + $.base64({data:tdData,type:0});
					window.open('data:application/sql;filename=exportData;' + base64data);
					
				
				}else if(defaults.type == 'json'){
				
					var jsonHeaderArray = [];
					$(el).find('thead').find('tr').each(function() {
						var tdData ="";	
						var jsonArrayTd = [];
					
						$(this).filter(':visible').find('th').each(function(index,data) {
							if ($(this).css('display') != 'none'){
								if(defaults.ignoreColumn.indexOf(index) == -1){
									jsonArrayTd.push(parseString($(this)));									
								}
							}
						});									
						jsonHeaderArray.push(jsonArrayTd);						
						
					});
					
					var jsonArray = [];
					$(el).find('tbody').find('tr').each(function() {
						var tdData ="";	
						var jsonArrayTd = [];
					
						$(this).filter(':visible').find('td').each(function(index,data) {
							if ($(this).css('display') != 'none'){
								if(defaults.ignoreColumn.indexOf(index) == -1){
									jsonArrayTd.push(parseString($(this)));									
								}
							}
						});									
						jsonArray.push(jsonArrayTd);									
						
					});
					
					var jsonExportArray =[];
					jsonExportArray.push({header:jsonHeaderArray,data:jsonArray});
					
					//Return as JSON
					//console.log(JSON.stringify(jsonExportArray));
					
					//Return as Array
					//console.log(jsonExportArray);
					if(defaults.consoleLog == 'true'){
						console.log(JSON.stringify(jsonExportArray));
					}
					var base64data = "base64," + $.base64({data:JSON.stringify(jsonExportArray),type:0});
					window.open('data:application/json;filename=exportData;' + base64data);
				}else if(defaults.type == 'xml'){
				
					var xml = '<?xml version="1.0" encoding="utf-8"?>';
					xml += '<tabledata><fields>';

					// Header
					$(el).find('thead').find('tr').each(function() {
						$(this).filter(':visible').find('th').each(function(index,data) {
							if ($(this).css('display') != 'none'){					
								if(defaults.ignoreColumn.indexOf(index) == -1){
									xml += "<field>" + parseString($(this)) + "</field>";
								}
							}
						});									
					});					
					xml += '</fields><data>';
					
					// Row Vs Column
					var rowCount=1;
					$(el).find('tbody').find('tr').each(function() {
						xml += '<row id="'+rowCount+'">';
						var colCount=0;
						$(this).filter(':visible').find('td').each(function(index,data) {
							if ($(this).css('display') != 'none'){	
								if(defaults.ignoreColumn.indexOf(index) == -1){
									xml += "<column-"+colCount+">"+parseString($(this))+"</column-"+colCount+">";
								}
							}
							colCount++;
						});															
						rowCount++;
						xml += '</row>';
					});					
					xml += '</data></tabledata>'
					
					if(defaults.consoleLog == 'true'){
						console.log(xml);
					}
					
					var base64data = "base64," + $.base64({data:xml,type:0});
					window.open('data:application/xml;filename=exportData;' + base64data);

				}else if(defaults.type == 'excel' || defaults.type == 'doc'|| defaults.type == 'powerpoint'  ){
					//console.log($(this).html());
					var excel="<table border='1'>";
					// Header
                                        var tdwidth = " width=68 ";
					$(el).find('thead').find('tr').each(function() {
						excel += "<tr>";
						$(this).filter(':visible').find('th').each(function(index,data) {
							if ($(this).css('display') != 'none'){					
								if(defaults.ignoreColumn.indexOf(index) == -1){
									var rgb = $(this).css('background-color'); 
									var color = $(this).css('color');
                                                                   
//									var originalFontSize = $(this).css("font-size"); 
									var originalFontSize = "24px"; 
									var font = $(this).css("font-family");
									var align = $(this).css("text-align");
									var colspan = $(this).attr("colspan");
									var rowspan = $(this).attr("rowspan");
									var fontWeight = $(this).css("font-weight");
									var fontSize = $(this).attr("fontsize");
									var style = " style= ";
									if(rgb){
										rbg = rgb2hex(rgb);
										style = style + " background-color:"+rbg+";";
									}
									if(font){
										style = style + " font-family:"+font+";";
									}
									
//									if(fontSize){
//										var arrSize = fontSize.split("px");
//										style = style + " font-size: "+arrSize[0]+"pt;";
//									}
//									else if(originalFontSize){
//										var arrSize = originalFontSize.split("px");
										style = style + " font-size: 24pt;";
//									}
									
									if(colspan>0){
										colspan = "colspan="+colspan+" ";
									}
									if(rowspan>0){
										rowspan = "rowspan="+rowspan+" ";
									}
									if(align){
										align = "align="+align+" ";
									}
									var  aStr = parseString($(this));
									//aStr = str.replace("打 印","");
									aStr=aStr.replace("打 印","");  
									aStr=aStr.replace("导Excel",""); 
									excel += "<td  "+tdwidth+colspan+align+style+" >" +aStr+ "</td>";
								}
							}
						});	
						excel += '</tr>';						
					});					
					
					// Row Vs Column
					var rowCount=1;
					$(el).find('tbody').find('tr').each(function() {
						excel += "<tr>";
						var colCount=0;
						$(this).filter(':visible').find('td').each(function(index,data) {
							if ($(this).css('display') != 'none'){	
								if(defaults.ignoreColumn.indexOf(index) == -1){
									var rgb = $(this).css('background-color'); 
									var color = $(this).css('color');
									var originalFontSize = $(this).css("font-size"); 
									var font = $(this).css("font-family");
									var align = $(this).css("text-align");
									var colspan = $(this).attr("colspan");
									var rowspan = $(this).attr("rowspan");
									var fontWeight = $(this).css("font-weight");
									var style = " style= ";
									if(rgb){
										rbg = rgb2hex(rgb);
										style = style + " background-color:"+rbg+";";
									}
									if(font){
										style = style + " font-family:"+font+";";
									}
									if(originalFontSize){
										var arrSize = originalFontSize.split("px");
										style = style + " font-size: "+arrSize[0]+"pt;";
									}
									if(colspan>0){
										colspan = "colspan="+colspan+" ";
									}
									else{
										colspan = "";
									}
									if(rowspan>0){
										rowspan = "rowspan="+rowspan+" ";
									}
									else{
										rowspan = "";
									}
									align = " align=center ";
									excel += "<td"+tdwidth+rowspan+colspan+align+style+" >" +parseString($(this))+ "</td>";
								}
							}
							colCount++;
						});															
						rowCount++;
						excel += '</tr>';
					});					
					excel += '</table>'
					
					if(defaults.consoleLog == 'true'){
						console.log(excel);
					}
					var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:"+defaults.type+"' xmlns='http://www.w3.org/TR/REC-html40'>";
					excelFile += "<head>";
					excelFile += "<!--[if gte mso 9]>";
					excelFile += "<xml>";
					excelFile += "<x:ExcelWorkbook>";
					excelFile += "<x:ExcelWorksheets>";
					excelFile += "<x:ExcelWorksheet>";
					excelFile += "<x:Name>";
					excelFile += "粮情检测表";
					excelFile += "</x:Name>";
					excelFile += "<x:WorksheetOptions>";
					excelFile += "<x:DisplayGridlines/>";
					excelFile += "</x:WorksheetOptions>";
					excelFile += "</x:ExcelWorksheet>";
					excelFile += "</x:ExcelWorksheets>";
					excelFile += "</x:ExcelWorkbook>";
					excelFile += "</xml>";
					excelFile += "<![endif]-->";
					//addStart
					excelFile +="<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>";
					excelFile +="<meta http-equiv='pragma' content='no-cache'>";
					excelFile +="<meta http-equiv='cache-control' content='no-cache'>";
					excelFile +="<meta http-equiv='expires' content='0'>";
					//addEnd
					excelFile += "</head>";
					excelFile += "<body>";
					excelFile += excel;
					excelFile += "</body>";
					excelFile += "</html>";
					if(isIE()){
						doFileExport(fileName,excelFile);
					}
					else{
						var base64data = "base64," + $.base64({data:excelFile,type:0});
						window.open('data:application/vnd.ms-'+defaults.type+';filename=exportData.xls;' + base64data);
					}
				}else if(defaults.type == 'png'){
					html2canvas($(el), {
						onrendered: function(canvas) {										
							var img = canvas.toDataURL("image/png");
							window.open(img);
						}
					});		
				}else if(defaults.type == 'pdf'){
	
					var doc = new jsPDF('p','pt', 'a4', true);
					doc.setFontSize(defaults.pdfFontSize);
					
					// Header
					var startColPosition=defaults.pdfLeftMargin;
					$(el).find('thead').find('tr').each(function() {
						$(this).filter(':visible').find('th').each(function(index,data) {
							if ($(this).css('display') != 'none'){					
								if(defaults.ignoreColumn.indexOf(index) == -1){
									var colPosition = startColPosition+ (index * 50);									
									doc.text(colPosition,20, parseString($(this)));
								}
							}
						});									
					});					
				
				
					// Row Vs Column
					var startRowPosition = 20; var page =1;var rowPosition=0;
					$(el).find('tbody').find('tr').each(function(index,data) {
						rowCalc = index+1;
						
					if (rowCalc % 26 == 0){
						doc.addPage();
						page++;
						startRowPosition=startRowPosition+10;
					}
					rowPosition=(startRowPosition + (rowCalc * 10)) - ((page -1) * 280);
						
						$(this).filter(':visible').find('td').each(function(index,data) {
							if ($(this).css('display') != 'none'){	
								if(defaults.ignoreColumn.indexOf(index) == -1){
									var colPosition = startColPosition+ (index * 50);									
									doc.text(colPosition,rowPosition, parseString($(this)));
								}
							}
							
						});															
						
					});					
										
					// Output as Data URI
					doc.output('datauri');
	
				}
				
				function zero_fill_hex(num, digits) {
				  var s = num.toString(16);
				  while (s.length < digits)
				    s = "0" + s;
				  return s;
				}
				
				function rgb2hex(rgb) {
					 if (rgb.charAt(0) == '#')
					 return rgb;
//					 rgb = rgb.replace(/[a-zA-Z]/g,"");
//					 rgb = rgb.replace("(","");
//					 rgb = rgb.replace(")","");
//					 var ds = rgb.split(",");
					 var ds = rgb.split(/\D+/);
					 var decimal = Number(ds[1]) * 65536 + Number(ds[2]) * 256 + Number(ds[3]);
					 return "#" + zero_fill_hex(decimal, 6);
				}
				
				function doFileExport(inName, inStr) {
				    var xlsWin = null;
				    if ( !! document.all("glbHideFrm")) {
				        xlsWin = glbHideFrm;
				    } else {
				        var width = 1;
				        var height = 1;
				        var openPara = "left=" + (window.screen.width / 2 + width / 2) + ",top=" + (window.screen.height + height / 2) + ",scrollbars=no,width=" + width + ",height=" + height;
				        xlsWin = window.open("", "_blank", openPara);
				    }
				    xlsWin.document.write(inStr);
				    xlsWin.document.close();
				    xlsWin.document.execCommand('Saveas', true, inName);
				    xlsWin.close();
				} 
		        function isIE() { //ie?
		            if (!!window.ActiveXObject || "ActiveXObject" in window)
		                return true;
		            else
		                return false;
		        }
				function parseString(data){
				
					if(defaults.htmlContent == 'true'){
						content_data = data.html().trim();
					}else{
						content_data = data.text().trim();
					}
					if(defaults.escape == 'true'){
						content_data = escape(content_data);
					}
					return content_data;
				}
			}
        });
    })(jQuery);
        
