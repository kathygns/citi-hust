﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserRealNameControl.ascx.cs" Inherits="Controls_UserRealNameControl" %>
<%@ Register Src="UserDetailControl.ascx" TagName="UserDetailControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<script  type="text/javascript" language="javascript">

function handlerPopup(e){
    x = (document.layers) ? e.pageX : event.clientX
    y = (document.layers) ? e.pageY : event.clientY
}

function addNode(el){
    var child=document.createElement("div");
    child.setAttribute("border", "1");
	child.setAttribute("style","display: none;");
	child.setAttribute("dojotype","dijit.Tooltip");
	child.setAttribute("widgetid","dijit_Tooltip_0");
	child.setAttribute("connectid",el.id);
    document.body.appendChild(child);
    child.innerHtml="abc";
}


</script>




<!-- 
包含该控件的页面应该包含:
1.  ScriptManager
2.  dojo引用和dojo.require("dijit.Tooltip");


style="display: none;" 
        
         CssClass="dijitTooltipDialog dijitTooltipABLeft dijitTooltipAbove"
        

-->

    <asp:Label ID="NameLabel" runat="server" Text="" ForeColor="Blue" ></asp:Label>



<asp:Panel ID="Panel1" runat="server" 
        
style="display: none;" 
        
         CssClass="dijitTooltipDialog dijitTooltipABLeft dijitAlignClient"
                 
        connectid="" 
        dojotype="dijit.Tooltip" 
        widgetid="dijit_Tooltip_0"
>
    <uc1:UserDetailControl id="UserDetailControl1" runat="server"></uc1:UserDetailControl>
</asp:Panel>
