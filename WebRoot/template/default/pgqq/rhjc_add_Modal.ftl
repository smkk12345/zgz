
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">基本情况调查表(共5项)</h4>
</div>
<div class="modal-body rhjc-add-con">
    <form id='rhjcAddForm' modelAttribute = "HouseBasic" action="${BASE_PATH}/pgqq/savehousebasic.action"
          accept-charset="UTF-8" method="post">
        <div id='aoJianiIndex+'>
            <h4><span class="label label-default">1.基本数据录入：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>房屋坐落:</label>
                    <input type='text' class='form-control input-sm  ' name='location'/>    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>联系固话:</label>

                    <input type='text' class='form-control input-sm  ' name='telephone' />       
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>手机:</label>
                    <input type='text' class='form-control input-sm fl dmDate' name='mobile'/>        
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>被腾退人姓名:</label>
                    <input type='text' class='form-control input-sm  ' name='names' />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>性别:</label>
                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='sex' >  
                        <option   value="-1">请选择</option>  
                        <option   value="0">男</option>  
                        <option   value="1">女</option> 
                    </select>  
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>年龄:</label>
                    <input type='text' class='form-control input-sm fl ' name='age' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>备用联系电话:</label>
                    <input type='text' class='form-control input-sm  ' name='remobile' />        
                </div>

                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>权属取得方式:</label>
                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='ownership' >  
                        <option   value="-1">请选择</option>  
                        <option value="0">自有</option>  
                        <option value="1">老宅</option> 
                        <option value="2">买卖</option>  
                        <option value="3">继承</option> 
                        <option value="4">其他</option> 
                    </select>  
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>房屋间数:</label>
                    <input type='text' class='form-control input-sm  ' name='housecount' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>本址在册户口簿数量:</label>
                    <input type='text' class='form-control input-sm  ' name='localbook'/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>本址在册户籍数量:</label>
                    <input type='text' class='form-control input-sm  ' name='localpeoplecount'/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>非本址在册户口簿数量:</label>
                    <input type='text' class='form-control input-sm  ' name='notlocalbook'/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>非本址在册户籍数量:</label>
                    <input type='text' class='form-control input-sm  ' name='notlocalpeoplecount'/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>拟被安置人口:</label>
                    <input type='text' class='form-control input-sm  ' name='people' />        
                </div>
            </div>
            <h4><span class="label label-default">2.被腾退房屋户籍登记情况：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <table id="table1" class="table">
                        <tr>
                            <td colspan="12" style="text-align: center;font-weight: bold">本址在册户籍家庭人口情况</td>
                        </tr>
                        <tr>
                            <th></th>
                            <th class="center">户主</th>
                            <th class="center">户籍性质</th>
                            <th class="center">姓名</th>
                            <th class="center">身份证号</th>
                            <th class="center">性别</th>
                            <th class="center">户关</th>
                            <th class="center">产关</th>
                            <th class="center">婚否</th>
                            <th class="center">类型</th>
                            <th class="center">工作单位</th>
                            <th class="center">人口类别</th>
                            <th class="center"></th>
                        </tr>
                        <tr class="add-list-1">
                            <td><input type="hidden" class='form-control input-sm ' name='vtype' value="0" style="width: 0px;"/>        </td>
                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='householder' >  
                                    <option   value="-1">请选择</option>  
                                    <option value="0">居</option>  
                                    <option value="1">农</option> 
                                </select>
                            </td>
                            <td><input type='text' class='form-control input-sm ' name='householdtype'/>        </td>
                            <td><input type='text' class='form-control input-sm  ' name='name' />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='vidcard'/>        </td>

                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='vsex' >  
                                    <option   value="-1">请选择</option>  
                                    <option value="0">男</option>  
                                    <option value="1">女</option> 
                                </select>
                            </td>
                            <td><input type='text' class='form-control input-sm  ' name='registeredrelate' />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='changrelate' />        </td>
                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='hasmarry' >  
                                    <option   value="-1">请选择</option>  
                                    <option value="0">已婚</option>  
                                    <option value="1">未婚</option> 
                                </select>
                            </td>
                            <td><input type='text' class='form-control input-sm  ' name='vtype' />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='vunit'/>        </td>
                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='peopletype' >
                                    <option   value="-1">请选择</option>    
                                    <option value="0">婚姻衍生人员</option>  
                                    <option value="1">配偶</option> 
                                    <option value="1">新生婴儿</option> 
                                    <option value="1">现役军人</option> 
                                    <option value="1">院校在校生</option> 
                                    <option value="1">服役人员</option> 
                                    <option value="1">其他</option>
                                </select>
                            </td>
                            <td>
                                <button type="button" class="btn btn-info btn-xs glyphicon glyphicon-remove-sign" onclick="javascript:delthis(this, 'add-list-1');">删除</button>
                            </td>
                        </tr>
                        <tr id="two-list-1-end">
                            <td colspan="12" style="text-align: center">
                                <button  type="button" class="btn btn-info btn-sm" onclick="addlist('#two-list-1-end', 'add-list-1')" >添加新行</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="12" style="text-align: center;font-weight: bold">非本址户籍家庭人口情况</td>
                        </tr>
                        <tr>
                            <th></th>
                            <th class="center">户主</th>
                            <th class="center">户籍性质</th>
                            <th class="center">姓名</th>
                            <th class="center">身份证号</th>
                            <th class="center">性别</th>
                            <th class="center">户关</th>
                            <th class="center">产关</th>
                            <th class="center">婚否</th>
                            <th class="center">类型</th>
                            <th class="center">工作单位</th>
                            <th class="center">人口类别</th>
                            <th class="center"></th>
                        </tr>
                        <tr class="add-list-2">
                            <td><input type="hidden" class='form-control input-sm ' name='vtype' value="1" style="width: 0px;"/>        </td>
                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='householder' > 
                                    <option   value="-1">请选择</option>   
                                    <option value="0">居</option>  
                                    <option value="1">农</option> 
                                </select>
                            </td>
                            <td><input type='text' class='form-control input-sm ' name='householdtype'/>        </td>
                            <td><input type='text' class='form-control input-sm  ' name='name' />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='vidcard'/>        </td>

                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='vsex' >  
                                    <option   value="-1">请选择</option>  
                                    <option value="0">男</option>  
                                    <option value="1">女</option> 
                                </select>
                            </td>
                            <td><input type='text' class='form-control input-sm  ' name='registeredrelate' />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='changrelate' />        </td>
                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='hasmarry' >
                                    <option   value="-1">请选择</option>    
                                    <option value="0">已婚</option>  
                                    <option value="1">未婚</option> 
                                </select>
                            </td>                         <td><input type='text' class='form-control input-sm  ' name='vtype' />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='vunit' />        </td>
                            <td>
                                <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='peopletype' > 
                                    <option   value="-1">请选择</option>   
                                    <option value="0">婚姻衍生人员</option>  
                                    <option value="1">配偶</option> 
                                    <option value="1">新生婴儿</option> 
                                    <option value="1">现役军人</option> 
                                    <option value="1">院校在校生</option> 
                                    <option value="1">服役人员</option> 
                                    <option value="1">其他</option>
                                </select>
                            </td>
                            <td>
                                <button type="button" class="btn btn-info btn-xs glyphicon glyphicon-remove-sign" onclick="javascript:delthis(this, 'add-list-2');">删除</button>
                            </td>
                        </tr>
                        <tr id="two-list-2-end">
                            <td colspan="12" style="text-align: center">
                                <button  type="button" class="btn btn-info btn-sm" onclick="addlist('#two-list-2-end', 'add-list-2')" >添加新行</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <h4><span class="label label-default">3.面积相关：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>宅基地测绘面积:</label>
                    <input type='text' class='form-control input-sm  ' name='zjdarea'/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>房屋测绘面积:</label>
                    <input type='text' class='form-control input-sm  ' name='fwarea' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>首层测绘面积:</label>
                    <input type='text' class='form-control input-sm  ' name='firstfloorarea'/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>二层以上面积:</label>
                    <input type='text' class='form-control input-sm  ' name='abovetwoarea' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>地下室面积:</label>
                    <input type='text' class='form-control input-sm  ' name='basement' />        
                </div>
            </div>
            <h4><span class="label label-default">4.经营状况：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>经营用房面积:</label>
                    <input type='text' class='form-control input-sm  ' name='operatearea' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>工商备案面积:</label>
                    <input type='text' class='form-control input-sm  ' name='businessarea' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>经营用途:</label>
                    <input type='text' class='form-control input-sm  ' name='operatecontent' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>执照字号:</label>
                    <input type='text' class='form-control input-sm  ' name='licensename'  />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>与被腾退人关系:</label>
                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='relate' >  
                        <option   value="-1">请选择</option>  
                        <option value="0">本人</option>  
                        <option value="1">本家庭成员</option> 
                        <option value="2">租赁</option>  
                        <option value="3">其他</option> 
                    </select>    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>执照标明经营场所:</label>
                    <input type='text' class='form-control input-sm  ' name='licenselocation' />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>税务登记证:</label>
                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='taxlicense' >  
                        <option   value="-1">请选择</option>  
                        <option value="0">有</option>  
                        <option value="1">无</option> 
                    </select>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>租赁协议:</label>
                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='leaselicense' > 
                        <option   value="-1">请选择</option>   
                        <option value="0">有</option>  
                        <option value="1">无</option> 
                    </select>       
                </div>    
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>完税证明:</label>
                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='taxprove' >
                        <option   value="-1">请选择</option>    
                        <option value="0">有</option>  
                        <option value="1">无</option> 
                    </select>       
                </div> 
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>执照编号:</label>
                    <input type='text' class='form-control input-sm  ' name='license'   placeholder='执照编号'/>        
                </div>
            </div>
            <h4><span class="label label-default">4.其他，残疾，大病，低保等：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <table id="table1" class="table">
                    <thead>
                        <tr>
                            <th class="center">类型</th>
                            <th class="center">姓名</th>
                            <th class="center">户籍序号</th>
                            <th class="center">低保/残疾证号</th>
                            <th class="center">大病名称</th>
                            <th class="center">低保有效期</th>
                            <th class="center">大病证明材料</th>
                            <th class="center"></th>
                        </tr>
                    </thead>
                    <tbody id="four-list">
                        <tr class="add-list-3">
                            <td>
                                <select name='otype' class="form-control input-sm" >
                                    <option value="">选择类型</option>
                                    <option value="0">低保</option>
                                    <option value="1">残疾</option>
                                    <option value="2">大病</option>
                                </select>
                            </td>
                            <td><input type='text' class='form-control input-sm ' name='name'  />        </td>
                            <td><input type='text' class='form-control input-sm ' name='peopleid'  />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='otypenum' />  </td>
                            <td><input type='text' class='form-control input-sm  ' name='illnessname' />        </td>
                            <td><input type='text' class='form-control input-sm  ' name='validatedate'/>        </td>
                            <td><input type='text' class='form-control input-sm  ' name='illnessprove'/>        </td>
                            <td>
                                <button type="button" class="btn btn-info btn-xs glyphicon glyphicon-remove-sign" onclick="javascript:delthis(this, 'add-list-3');">删除</button>
                            </td>
                        </tr>
                        <tr id="four-list-end">
                            <td colspan="7" style="text-align: center">
                                <button  type="button" class="btn btn-info btn-sm" onclick="addlist('#four-list-end', 'add-list-3')" >添加新行</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <h4><span class="label label-default">5.备注：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <textarea class="form-control" rows="5" name="remark" placeholder="备注(选填，限1500字)"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary btn-save"   >保存</button>
            </div>
        </div>
    </form>
</div>

<script type = "text/javascript">


    function saveClick(btn) {
        var dataInfo = $("#rhjcAddForm").serialize();
        var url = $(btn - save).attr("data-url");
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            },
            success: function (response) {
                var bean = response.bean;
                addAoJianInfo(bean);
                //初始化日期控件
                initDate();
            }
        })
    }

    function addlist(a, c) {
        var b = $(a + "").prev();
        var h = b.html();
        b.after("<tr class=" + c + "" + ">" + h + "</tr>" + "");
    }

    function delthis(f, c) {
        var num = $(f).parent().parent().parent().children('.' + c).length;
        if (num > 1) {
            $(f).parent().parent().remove();
        } else {
            alert("至少保留一行！");
        }


    }
</script>