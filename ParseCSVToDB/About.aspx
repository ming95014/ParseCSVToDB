﻿<%@ Page Title="About Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ParseCSVToDB.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2 style="text-align:center">Objectives and Context Data</h2>

        <h4>Public Disclosure of Travel and Expenses</h4>
        <p>
        We ultimately wanted to know if the money that was expensed by our public officials were reasonable, and not being abuse.
        </p>
        <p>But, with the thousands of expenses, where do we being to look for expenses to inspect?</p>
        <ul>
            <li><a href="Analyze1.aspx?v=0">Start with ministries with the highest expense, then drill down to find officials, and finally expenses.</a></li>
            <li><a href="Analyze1.aspx?v=1">Start with officials  with the highest expense, and find other expenses for his/her other expenses.</a></li>            
            <li><a href="Analyze1.aspx?v=2">Start with the highest expenses, and examine the receipts.</a></li>
            <li><a href="Analyze1.aspx?v=3">Start with types of expenses and drill down to find high expenses of particular type.</a></li>
            <li><a href="Analyze1.aspx?v=4">Start with an official with name searches.</a></li>
            <li><a href="Analyze1.aspx?v=5">Show the expenses by ministry in a graphical chart.</a></li>
            <!--<li>What are some of the high expenses per Type and are they reasonable?</li>-->
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

        <h3>Context of the Available Data</h3>

        <a target="_blank" href="Data.aspx">See the summary of data set</a>
    </div>
</asp:Content>
