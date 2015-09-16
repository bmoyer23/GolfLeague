<%@ Page Title="Division" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Division.aspx.cs" Inherits="GolfLeague.Division" %>
<%@ Register Src="~/UC/DivisionUC.ascx" TagPrefix="uc1" TagName="DivisionUC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h3 class="text-center uppercase"><%: Title %>  </h3>
    <br />

    <div class="container">
        <div class="row" id="divLeague">
            <div class="panel panel-info">
                <div class="panel-heading">Divisions</div>
                <div class="panel-body">
                    <uc1:DivisionUC runat="server" ID="DivisionUC" ValidationGroup="ValidateDivision" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
