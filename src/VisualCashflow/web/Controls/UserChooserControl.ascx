<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserChooserControl.ascx.cs" Inherits="Controls_UserChooserControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


    
    <asp:TextBox runat="server" ID="UserTextBox" Width="245px" autocomplete="off" />
    
    
<ajax:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
    
    TargetControlID="UserTextBox" 
    WatermarkText="请输入姓名"
    WatermarkCssClass="watermarked"
>
</ajax:TextBoxWatermarkExtender>


<ajax:AutoCompleteExtender
                runat="server" 
                BehaviorID="AutoCompleteEx"
                ID="autoComplete1" 
                TargetControlID="UserTextBox"
                ServicePath="/web/WebService/UserNameSuggestionService.asmx" 
                
                
                ServiceMethod="GetCompletionList"
                MinimumPrefixLength="1" 
                CompletionInterval="500"
                EnableCaching="true"
                CompletionSetCount="20"
                CompletionListCssClass="autocomplete_completionListElement" 
                CompletionListItemCssClass="autocomplete_listItem" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                DelimiterCharacters=";, :">
                <Animations>
                    <OnShow>
                        <Sequence>
                            <%-- Make the completion list transparent and then show it --%>
                            <OpacityAction Opacity="0" />
                            <HideAction Visible="true" />
                            
                            <%--Cache the original size of the completion list the first time
                                the animation is played and then set it to zero --%>
                            <ScriptAction Script="
                                // Cache the size and setup the initial size
                                var behavior = $find('AutoCompleteEx');
                                if (!behavior._height) {
                                    var target = behavior.get_completionList();
                                    behavior._height = target.offsetHeight - 2;
                                    target.style.height = '0px';
                                }" />
                            
                            <%-- Expand from 0px to the appropriate size while fading in --%>
                            <Parallel Duration=".4">
                                <FadeIn />
                                <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                            </Parallel>
                        </Sequence>
                    </OnShow>
                    
                    <OnHide>
                        <%-- Collapse down to 0px and fade out --%>
                        <Parallel Duration=".4">
                            <FadeOut />
                            <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                        </Parallel>
                    </OnHide>
                    
                    
                </Animations>
            </ajax:AutoCompleteExtender>
