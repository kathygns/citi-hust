<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>捐款人注册</title>
    
    
        <style type="text/css">
             @import "/web/css/upload.css";
        </style>
        
        
        
</head>
<body class="tundra">
    <form id="form1" runat="server">
        <div>
            
            <uc1:HeaderControl ID="HeaderControl1" runat="server" />
            
            <script type="text/javascript" src="/web/js/jquery.js"></script>
	        <script type="text/javascript" src="/web/js/interface.js"></script>
	        <script type="text/javascript" src="/web/js/upload.js"></script>
	
        	
            <script type="text/javascript">
                dojo.require("dijit.form.ValidationTextBox");
                //检查重复密码是否和密码一致的验证函数。
   		        function repeadPassword(constraints){
			        return document.getElementById("FormView1_PasswordTextBox").value;
			        //TODO: 这里假设生成的客户端ID为FormView1_PasswordTextBox，
		        }

                
                        
            </script>


            <script type="text/javascript">
            
            //TODO:为什么这些函数不能放在一个单独文件里面。

            $(document).ready(function(){
	            uploadcreate($("#uploadbox"));
            });

            var hideDiv = function(idName){
	            $("#"+idName).fadeOut("fast");
            };

            //载入中的GIF动画
            var loadingUrl = "images/ajax-loading.gif";

            //选择文件后的事件,iframe里面调用的
            var uploading = function(imgsrc){
                var el = $("#uploading");
                $("#ifUpload").fadeOut("fast");
                el.fadeIn("fast");
                el.html("<img src='"+loadingUrl+"' align='absmiddle' /> 上传中...");
                return el;
            };

            //重新上传方法    
            var uploadinit = function(){
                $("#uploading").fadeOut("fast",function(){
                     $("#ifUpload").fadeIn("fast");
                });
                       
            };

            //上传时程序发生错误时，给提示，并返回上传状态
            var uploaderror = function(){
                alert("程序异常，上传未成功。");
                uploadinit();
            };

            //上传成功后的处理
            var uploadsuccess = function(newpath){
                $("#txtContent").append("<img src=\""+newpath+"\" onload=\"if(this.width>300){this.width=300;}\" />");
  	            
  	            
  	            var el = $("#uploading");
	            el.html("上传成功,<a href=\"javascript:void(0);\" onclick=\"uploadinit();\">[重新上传]</a>.");
	            
  	            var el = $("#panelViewPic");
  	            el.fadeIn("fast");
	            el.html("<img src=\""+newpath+"\" class=\"image\" onload=\"if(this.width>300){this.width=300;}\" />");
	            
	            $("#<%=FormView1.FindControl("PhotoTextBox").ClientID %>")[0].value=newpath;
	            
            };


            //创建一个上传控件
            var uploadcreate = function(el){
                var strContent = "<div class='uploadcontrol'><iframe src=\"Upload.aspx\" id=\"ifUpload\" frameborder=\"no\" scrolling=\"no\" style=\"width:400px; height:28px;\"></iframe>";
                strContent += "<div class=\"uploading\" id=\"uploading\" style=\"display:none;\" ></div>";
                strContent += "<div class=\"image\" id=\"panelViewPic\" style=\"display:none;\"></div></div>";
                el.append(strContent);
            };






            	 	
            	 	
         </script>
         
         <script language="javascript" type="text/javascript">
            //TODO:注意这里要使用CDATA；
            function CallServer(input1,input2,input3,input4,context)
            {
              
                  //为你在文本框中输入的信息，并且arg在这里就是将其值传递到
                  //RaiseCallbackEvent(String eventArgument)方法对应的eventArgument中
                  arg=input1.value+"|gzjoin|"+input2.value+"|gzjoin|"+input3.value+"|gzjoin|"+input4.innerHTML;
                  //arg = infokind.value+"|gzjoin|"+infotitle.value+"|gzjoin|"+infosource.value+"|gzjoin|"+ input.innerHTML;
                  //获取一个对客户端函数的引用；调用该函数时，将启动一个对服务器端事件的客户端回调。
                  <%= ClientScript.GetCallbackEventReference(this, "arg", "ReceiveServerData", "context")%>; 
            }
                
                //客户端回调---回收处理
                 function ReceiveServerData(result, context)
                {
                    //context.innerText = result;
                    
                    alert(title.value+"  录入成功！");
                    //title.value=result;
                    //self.location="addimage.aspx?infoid="+result;
                }

            function btup_onclick() 
            {
               //其他参数可以通过string类型上传，但是图片如何同时上传？
            }

            function btadd_onclick() {

            //此处点击一次，添加一个inputfile控件
            }


            </script>

            <script type="text/javascript">
                function checkUserNameUsed(/*Boolean*/isFocused){
                    return (this.textbox.value=="abc") && this.validator(this.textbox.value, this.constraints);
			
			
        }
            </script>

            <br />
            捐款人注册<br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="UserDataSource"
                DefaultMode="Insert">
                <InsertItemTemplate>
                    <br />
                    <table>
                        <tr>
                            <td style="width: 100px">
                                用户名</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' 
                                dojoType="dijit.form.ValidationTextBox"
                                regExp="^[a-zA-Z][a-zA-Z0-9_]{3,15}$"
                                required="true"
                                invalidMessage="用户名不规范，请使用4-16个字符，允许英文、数字、下划线"
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: red">
                                *</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                密码</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>'
                                dojoType="dijit.form.ValidationTextBox"
                                required="true"
                                invalidMessage="密码必填"
                                TextMode="Password"></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                重复密码</td>
                            <td style="width: 100px">
                                <input id="repeadPasswd" type="password" 
                                
                                dojoType="dijit.form.ValidationTextBox"
                                regExpGen="repeadPassword"
                                required="true"
                                invalidMessage="两次输入的密码不一致！"
                                
                                />
                            
                            </td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                安全密码问题</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="SecureQuestionTextBox" runat="server" Text='<%# Bind("SecureQuestion") %>'
                                dojoType="dijit.form.ValidationTextBox"
                                required="true"
                                invalidMessage="必填"
                                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                安全密码答案</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="SecureAnswerTextBox" runat="server" Text='<%# Bind("SecureAnswer") %>'
                                dojoType="dijit.form.ValidationTextBox"
                                required="true"
                                invalidMessage="必填"
                                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                </td>
                            <td style="width: 100px">
                                </td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                姓名</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="RealNameTextBox" runat="server" Text='<%# Bind("RealName") %>'
                                
                                dojoType="dijit.form.ValidationTextBox"
                                regExp="[\u4e00-\u9fa5]{2,8}"
                                required="true"
                                invalidMessage="不是正确的姓名(2-8个汉字)"
                                
                                
                                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                性别</td>
                            <td style="width: 100px">
                                <asp:DropDownList ID="SexDropDownList" runat="server" SelectedValue='<%# Bind("Sex") %>' 
                                
                                
                                >
                                    <asp:ListItem Text="男" Value="True" Selected="true"> </asp:ListItem>
                                    <asp:ListItem Text="女" Value="False"> </asp:ListItem>
                                </asp:DropDownList>
                                </td>
                                
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                年龄</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>'
                                
                                
                                dojoType="dijit.form.ValidationTextBox"
                                regExp="\d{2}"
                                required="true"
                                invalidMessage="年龄输入有误"
                                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                电话</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TelTextBox" runat="server" Text='<%# Bind("Tel") %>'
                                
                                dojoType="dijit.form.ValidationTextBox"
                                regExp="\d{3}-\d{8}|\d{4}-\d{7}"
                                required="true"
                                invalidMessage="正确的格式如 0511-4405222 或 021-87888822"
                                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                Email</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>'
                                
                                dojoType="dijit.form.ValidationTextBox"
                                regExp="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                required="true"
                                invalidMessage="不是正确的Email地址"
                                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                地址</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>'
                                dojoType="dijit.form.ValidationTextBox"
                                required="true"
                                invalidMessage="必填"
                                
                                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                                <span style="color: #ff0000">*</span></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                头像</td>
                            <td style="width: 100px" id="uploadbox">
                                <asp:TextBox ID="PhotoTextBox" runat="server" Text='<%# Bind("Photo") %>'></asp:TextBox>
                                <br />
                                
                            </td>
                            <td style="width: 100px" >
                            
                                
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px; height: 110px;">
                                备注</td>
                            <td style="width: 100px; height: 110px;">
                                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' Height="105px" TextMode="MultiLine" Width="390px"></asp:TextBox></td>
                            <td style="width: 100px; height: 110px;">
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="注册"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="取消"></asp:LinkButton>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="UserDataSource" runat="server" InsertMethod="AddDonor"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="BLL.VCFDataSetTableAdapters.UserTableAdapter">
                <InsertParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="SecureQuestion" Type="String" />
                    <asp:Parameter Name="SecureAnswer" Type="String" />
                    <asp:Parameter Name="Photo" Type="String" />
                    <asp:Parameter Name="RealName" Type="String" />
                    <asp:Parameter Name="Sex" Type="Boolean" />
                    <asp:Parameter Name="Age" Type="Int32" />
                    <asp:Parameter Name="Tel" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Comment" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <br />
            <br />
            <br />
            <br />
            &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" Width="522px" /></div>
    </form>
</body>
</html>
