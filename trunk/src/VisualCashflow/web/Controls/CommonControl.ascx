<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommonControl.ascx.cs" Inherits="Controls_CommonControl" %>
    
    <style type="text/css">
    
        /*my css*/
        @import "/web/css/g.css";
        
    
        /*ajaxControlToolkit*/
        @import "/web/css/ajaxControlToolkit.css";
        
        /*dojo:*/
        @import "/web/js/dojo1.1.1/dijit/themes/tundra/tundra.css";
        @import "/web/js/dojo1.1.1/dijit/themes/soria/soria.css";
        
        @import "/web/js/dojo1.1.1/dojo/resources/dojo.css";
    </style>

    
    <script type="text/javascript" src="/web/js/dojo1.1.1/dojo/dojo.js"
	    djConfig="parseOnLoad:true, isDebug:true"></script>
	    
    <script type="text/javascript">
        console.log("start");
        dojo.require("dojo.parser");
        dojo.require("dijit.form.TextBox");
        dojo.require("dijit.Tooltip");
    </script>


