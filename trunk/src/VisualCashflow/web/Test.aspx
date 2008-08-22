<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
            "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TooltipDialog demo</title>
    <style type="text/css">
        @import "http://o.aolcdn.com/dojo/1.0/dijit/themes/tundra/tundra.css";
        @import "http://o.aolcdn.com/dojo/1.0/dojo/resources/dojo.css"
    </style>
    <script type="text/javascript" src="http://o.aolcdn.com/dojo/1.0/dojo/dojo.xd.js" 
        djConfig="parseOnLoad: true"></script>
    <script type="text/javascript">
       dojo.require("dojo.parser");
       dojo.require("dijit.form.Button");
       dojo.require("dijit.Dialog");
       dojo.require("dijit.form.TextBox");
       function checkPw(dialogFields) {
          if (dialogFields.confirmpw != dialogFields.newpw) 
             alert("Confirmation password is different.  Password is unchanged.");
       }
     </script>
</head>
<body class="tundra">

<button dojoType="dijit.form.Button" id="helloButton" >
        Hello World!
        <script type="dojo/method" event="onFocus">
        dojo.log("abc");
           alert('You pressed the button');
        </script>
    </button>
    
    
    
<div dojoType="dijit.form.DropDownButton">
        <span>show user 0 detail</span>
        
        
        <script type="dojo/method" event="onClick">
        alert('over');
    </script>
        
        
        
        <div dojoType="dijit.TooltipDialog" id="dialog1" title="First Dialog" execute="checkPw(arguments[0]);" 
         href="/web/UserDetail.aspx"
         >
         
           content
        </div>
</div> 
</body></html>