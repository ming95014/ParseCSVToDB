<%@ Page Title="About Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ParseCSVToDB.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />
        <img src="images/ChallengePost.png" alt="ChallengePost" /><img src="images/AppsForAlberta.png" alt="Apps for Alberta" width="300" />
        <h2 style="text-align:center">Objectives and Context Data</h2>

        <h4>Public Disclosure of Travel and Expenses</h4>
        <p>
        We ultimately wanted to know if the money that was expensed by our public officials were reasonable, and not being abuse.
        </p>
        <p>But, with thousands of expenses, where do we begin to look for expenses to inspect?</p>
        <p>
            To find any waste or abuse, if any, this application offer several starting points, below, then
            filter for a particular time range, then it allows you to drilling down to find further information.
        </p>
        <ul>
            <li><a href="Analyze1.aspx?v=0">Starts with ministries with the highest expense, then drill down to find officials, and finally expenses.</a></li>
            <li><a href="Analyze1.aspx?v=1">Starts with officials  with the highest expense, and find other expenses for his/her other expenses.</a></li>            
            <li><a href="Analyze1.aspx?v=2">Starts with the highest expenses, and examine the receipts.</a></li>
            <li><a href="Analyze1.aspx?v=3">Starts with types of expenses and drill down to find high expenses of particular type.</a></li>
            <li><a href="Analyze1.aspx?v=4">Searches for an official name search, then drill down to find expenses for this official.</a></li>
        </ul>
        <p>Additionally, it also presents you with charts to :</p>
        <ul>
            <li><a href="Analyze1.aspx?v=5">Show the expenses by all ministries in a graphical chart.</a></li>
            <li><a href="Analyze1.aspx?v=6">Show the Expenses Type of selected ministry or official in a graphical chart.</a></li>
        </ul>
        <!--
        <p>Additionally, this application will help you see the following :</p>
        <ul>
            <li>Ranking of Ministry that spent the most money</li>
            <li>Ranking of people in that ministry who spent the most money</li>
            <li>Ranking of people who expensed the most often</li>
            <li>Ranking of people who expensed the most per expense</li>
            <li>Drill down based on largest expenses  ==> this maybe important if only a few big expenses were made</li>
        </ul>
        -->
        <h3>Context of the Available Data</h3>

        <a target="_blank" href="Data.aspx">See the summary of data set</a>
    </div>
    <script>
        $('a').filter(function () {
            return this.innerHTML == "Objectives and Context Data";
        }).css({ color: "#FFFF00" });
    </script>
</asp:Content>
