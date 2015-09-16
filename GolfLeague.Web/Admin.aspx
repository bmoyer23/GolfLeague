<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GolfLeague.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4">
            <h2>Leagues</h2>
            <p>Create leagues, divisions, and teams.</p>
            <p>
                <a class="btn btn-success" href="League.aspx">GO &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Courses</h2>
            <p>Create courses, tees, and scorecards.</p>
            <p>
                <a class="btn btn-success" href="Course.aspx">GO &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Players</h2>
            <p>Create players and assign to teams.</p>
            <p>
                <a class="btn btn-success" href="Player.aspx">GO &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
