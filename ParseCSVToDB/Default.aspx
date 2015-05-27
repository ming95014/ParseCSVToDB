<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ParseCSVToDB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <img src="images/ChallengePost.png" alt="ChallengePost" /><img src="images/AppsForAlberta.png" alt="Apps for Alberta" width="300" />
    <h2>Use Alberta open data to create apps for Alberta</h2>
    
    <p>
        The Government of Alberta, in partnership with Alberta Innovates Technology Futures, is hosting Apps for Alberta, an innovation competition using Alberta open data. 
        Apps for Alberta is offering $70,000 in cash prizes to encourage the brightest and most creative minds in Canada and the United States to develop apps that use open data from the Alberta Open Data Portal.
        For more information, visit the following link <a target="_blank" href="http://appsforalberta.challengepost.com/">http://appsforalberta.challengepost.com/</a>
    </p>

    <p>
        This application specifially focuses on the following dataset : 
        <a target="_blank" href="http://data.alberta.ca/data/public-disclosure-travel-and-expenses">Public Disclosure of Travel and Expenses</a>
    </p>

    Continue to <a href="About.aspx"> Objectives and Context Data </a>
    <script>
        $('a').filter(function () {
            return this.innerHTML == "Travel and Expenses";
        }).css({ color: "#FFFF00" });
    </script>
</asp:Content>
