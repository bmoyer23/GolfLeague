<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GolfLeague._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 style="color:green">Golf League</h1>
        <p class="lead">Application for accessing your golf league data from anywhere. Manage players, teams, enter golf scores and track handicaps.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Administration</h2>
            <p>
                Setup all aspects of the league. For admin users only.
            </p>
            <p>
                <a class="btn btn-success" href="Admin.aspx">GO &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Enter Scores</h2>
            <p>
                For all golfers to enter their completed rounds.
            </p>
            <p>
                <a class="btn btn-success" href="Score.aspx">GO &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Reporting</h2>
            <p>
                For all golfer to get weekly results and handicap indexes.
            </p>
            <p>
                <a class="btn btn-success" href="Report.aspx">GO &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
