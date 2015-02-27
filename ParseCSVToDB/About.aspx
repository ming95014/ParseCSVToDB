<%@ Page Title="About Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ParseCSVToDB.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h3>About</h3>
        <p>
        We ultimately wanted to know if the money that was expensed by our public officials were reasonable, and not being abuse.
        </p>
        <ul>
            <li>Which ministries are spending the most, and are they reasonable?</li>
            <li>Which officials are spending the most, and are they reasonable?</li>
            <li>What are some of the high expenses, and are they reasonable?</li>
        </ul>
        <p>
            To find any waste or abuse, if any, we look for who spent the most, and go from there.
            During a particular time range, or entire time available
        </p>
        <ul>
            <li>Drill down from ministry to people to particular expense</li>
            <li>Ranking of Ministry that spent the most money</li>
            <li>Ranking of people in that ministry who spent the most money</li>
            <li>Ranking of people who expensed the most often</li>
            <li>Ranking of people who expensed the most</li>
            <li>Drill down based on largest expenses  ==> this maybe important if only a few big expenses were made</li>
        </ul>
    </div>
</asp:Content>
