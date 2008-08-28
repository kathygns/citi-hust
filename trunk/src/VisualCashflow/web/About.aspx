<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        <br />
        <br />
        <br />
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                公益基金现金流可视化是这样一个平台，它可以让大到跨国企业、小到平民老百姓都可以很方便的针对每一个公益项目进行捐款，并且可以以投票的形式参与到公益资金的使用中来，通过一个可视化的界面向公众展示每一笔资金的流向，这个流向是透明的，详细的，图形明确性。主要涉及的研究领域是现金流管理。</span></p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                对于每一个公益项目，系统会为它建立一个项目，并指定项目管理员，项目管理员可以根据需要添加下级管理员，查看和分配本项目资金。下级管理员可以分配自己管理范围内的资金，系统将记录每次资金的转移，管理员必须对自己管理范围内的资金使用，分配过程负责，</span></p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                对于捐献者。任何拥有银行账户的人都可以注册为捐献者。系统将记录其姓名，单位等个人信息，并会为其记录信誉度，用户可以自行选择是否公开自己的个人信息。此外，捐献者对资金的使用享有参与权，表明他们倾向于将钱捐向某个项目。</span></p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                对于资金的使用者（接收者）。所有的接收者也必须是经过相关部门授权的</span><span lang="EN-US">ID</span><span style="font-family: 宋体;
                    mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">。他们必须对接收的资金负责，接收资金时要签名并承诺用于实处，每一笔资金的使用都会经过上一层管理员的确认，以保证资金落到实处，建立完善的反馈确认机制。他们的信息和操作也是完全透明的。</span></p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span lang="EN-US">
                <?xml namespace="" ns="urn:schemas-microsoft-com:office:office" prefix="o" ?>
                <o:p>&nbsp;</o:p>
            </span>
        </p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                本平台的主要特点是透明性、详细性、图形明确性。</span></p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                透明性是任何人都可以看到本平台接收了多少捐献，用于了多少项目。同时平台存在多层，每一层都是透明的。</span></p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                详细性是针对捐献者和接收者两方面而言的。对于捐献者，他们可以清楚的看到他们的捐款被用在哪些项目，每个项目是多少钱，接收者又分别是谁。并且这些资金保证精确到捐钱的最小单位，比如说元；对于接收者，每一笔使用出去的资金都会记录下来，这些信息都将反馈给上一层管理员，管理员对这些资金是否用到实处进行确认，以保证捐款人的利益。</span></p>
        <p class="125" style="margin: 6pt 0cm; text-indent: 24pt">
            <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                图形明确性指这个平台不仅仅提供一些文字数据，而且还提供大量的图形，让公众都能直观的看到平台的数据。这些图形包括曲线图，比例图，表格，地图等一切可以用上的信息。</span></p>
    
    </div>
    </form>
</body>
</html>
