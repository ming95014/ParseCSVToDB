<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ParseCSVToDB.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--<h2><%: Title %>.</h2>-->
    <br />
    <img src="images/ChallengePost.png" alt="ChallengePost" /><img src="images/AppsForAlberta.png" alt="Apps for Alberta" width="300" />
    <h2 style="text-align:center">Author and Credits</h2>
    <h3>Ming Chien</h3>
    <!--
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>
    -->
    <address>
        <strong>Linked In : <a target="_blank" title="open a new browser to Linked profile" href="https://www.linkedin.com/pub/ming-chien/a/a71/639">LinkedIn Profile for Ming Chien</a> </strong>
        <br />
        <strong>Email:</strong>   <a href="mailto:mingch@yahoo.com">mingch@yahoo.com</a><br />
        <!--<strong>Marketing:</strong> <a href="mailto:mingch@yahoo.com">mingch@yahoo.com</a>-->
    </address>
    <h3 style="color:red">Known Issues:</h3>
    <ul>
        <li>Recipts links do not show up correctly in Internet Explorer.</li>
        <li>When Exporting report to Excel format, and opening the report will get a warning about format difference, it's OK to click on <b>Yes</b> to proceede to open the saved Excel file.</li>
    </ul>
    <script>
        $('a').filter(function () {
            return this.innerHTML == "Author and Credits";
        }).css({ color: "#FFFF00" });
    </script>
</asp:Content>
