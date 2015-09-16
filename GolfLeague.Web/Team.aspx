<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="GolfLeague.Team" %>

<%@ Register Src="~/UC/TeamUC.ascx" TagPrefix="uc1" TagName="TeamUC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h3 class="text-center uppercase"><%: Title %>  </h3>
    <br />

    <div class="container">
        <div class="row" id="divTeam">
            <div class="panel panel-info">
                <div class="panel-heading">Teams</div>
                <div class="panel-body">
                    <uc1:TeamUC runat="server" id="TeamUC" ValidationGroup="ValidateTeam" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
