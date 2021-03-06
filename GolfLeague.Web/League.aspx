﻿<%@ Page Title="League Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="League.aspx.cs" Inherits="GolfLeague.League" %>

<%@ Register Src="~/UC/DivisionUC.ascx" TagPrefix="uc1" TagName="DivisionUC" %>
<%@ Register Src="~/UC/LeagueUC.ascx" TagPrefix="uc1" TagName="LeagueUC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h3 class="text-center uppercase"><%: Title %>  </h3>
    <br />

    <div class="container">
        <div class="row" id="divLeague">
            <div class="panel panel-info">
                <div class="panel-heading">Leagues</div>
                <div class="panel-body">
                    <uc1:LeagueUC runat="server" ID="LeagueUC" ValidationGroup="ValidateLeague" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
