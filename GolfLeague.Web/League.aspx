<%@ Page Title="Leagues" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="League.aspx.cs" Inherits="GolfLeague.League" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h3 class="text-center uppercase"><%: Title %>  </h3>
    <br />

    <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped table-condensed" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1"
        DataKeyNames="ID" OnRowDataBound="OnRowDataBound" EmptyDataText="No records has been added." AllowSorting="true">
        <Columns>
            <asp:BoundField DataField="LeagueName" HeaderText="Name" SortExpression="LeagueName" />
            <asp:BoundField DataField="DateCreated" HeaderText="Created Date" ItemStyle-Width="200px" SortExpression="DateCreated" />
            <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="100px"
                    ShowEditButton="True" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
            <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="100px"
                    ShowDeleteButton="True" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
        </Columns>
    </asp:GridView>

    <div class="panel panel-default">
        <div class="panel-heading">Add New League</div>
        <div class="panel-body">
            <div class="form-inline">
                <label for="txtLeagueName">League Name:</label>
                <asp:TextBox CssClass="form-control" ID="txtLeagueName" runat="server" />
                <asp:CustomValidator ID="ValidateLeagueName" ControlToValidate="txtLeagueName" runat="server" Display="Dynamic"
                        ErrorMessage="This League Name already exists" ForeColor="Red" OnServerValidate="ValidateLeagueName_ServerValidate"></asp:CustomValidator>
                <asp:Button CssClass="btn btn-default" ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
            </div>
        </div>
    </div>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GolfLeagueDBConnString %>"
        SelectCommand="SELECT ID, LeagueName, DateCreated FROM dbo.League ORDER BY LeagueName"
        InsertCommand="INSERT INTO dbo.League (ID, LeagueName, DateCreated) VALUES (NewID(), @LeagueName, GetDate())"
        UpdateCommand="UPDATE dbo.League SET LeagueName = @LeagueName WHERE ID = @ID"
        DeleteCommand="DELETE FROM dbo.League WHERE ID = @ID">
        <InsertParameters>
            <asp:ControlParameter Name="LeagueName" ControlID="txtLeagueName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Object" />
            <asp:Parameter Name="LeagueName" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Object" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
