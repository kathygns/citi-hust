// JScript 文件


  
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
