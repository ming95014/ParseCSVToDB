<%@ Page Title="About Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ParseCSVToDB.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h3>Objectives</h3>

        <h4>Public Disclosure of Travel and Expenses</h4>
        <p>
        We ultimately wanted to know if the money that was expensed by our public officials were reasonable, and not being abuse.
        </p>
        <ul>
            <li><a href="Analyze1.aspx">Which ministries are spending the most, and are they reasonable?</a></li>
            <li>Which officials are spending the most, and are they reasonable?</li>
            <li>What are some of the high expenses per Type and are they reasonable?</li>
            <li>What are some of the high expenses, and are they reasonable?</li>
        </ul>
        <p>
            To find any waste or abuse, if any, this application offer the above 3 starting points,
            during a particular time range, or entire time available, then it allows you to drilling down to find further information.
        </p>
        Additionally, this application will help you see the following :
        <ul>
            <li>Ranking of Ministry that spent the most money</li>
            <li>Ranking of people in that ministry who spent the most money</li>
            <li>Ranking of people who expensed the most often</li>
            <li>Ranking of people who expensed the most per expense</li>
            <!--<li>Drill down based on largest expenses  ==> this maybe important if only a few big expenses were made</li>-->
        </ul>
    </div>
</asp:Content>
