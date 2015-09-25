<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeagueUC.ascx.cs" Inherits="GolfLeague.UC.LeagueUC" %>

<asp:GridView ID="GridView1" CssClass="table table-bordered table-striped table-condensed" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1"
    DataKeyNames="ID" OnRowDataBound="OnRowDataBound" EmptyDataText="No records has been added." AllowSorting="true" AllowPaging="true" PageSize="5"
    OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="OnSelectedIndexChanged" PagerSettings-Mode="NumericFirstLast">
    <Columns>
        <asp:BoundField DataField="LeagueName" HeaderText="League Name" SortExpression="LeagueName" />
        <asp:BoundField DataField="DateCreated" HeaderText="Created Date" ItemStyle-Width="200px" SortExpression="DateCreated" />
        <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-sm btn-default" ItemStyle-Width="50px"
            ShowEditButton="True" EditText="<i aria-hidden='true' class='glyphicon glyphicon-pencil'></i>" />
        <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-sm btn-default" ItemStyle-Width="50px"
            ShowDeleteButton="True" DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
        <asp:ButtonField ButtonType="Link" Text="Divisions" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="75px"
            CausesValidation="false" CommandName="Divisions" />
        <asp:ButtonField ButtonType="Link" Text="Players" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="75px"
            CausesValidation="false" CommandName="Players" />

    </Columns>
</asp:GridView>

<div class="form-inline">
    <label for="txtLeagueName">League Name:</label>
    <asp:TextBox CssClass="form-control" ID="txtLeagueName" runat="server" />

    <asp:Button CssClass="btn btn-default" ID="btnAdd" runat="server" Text="Add New" OnClick="Insert" />
    <div class="form-group">
        <asp:RequiredFieldValidator ID="RequireLeagueName" ControlToValidate="txtLeagueName" runat="server" Display="Dynamic"
            ErrorMessage="League Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="ValidateLeagueName" ControlToValidate="txtLeagueName" runat="server" Display="Dynamic"
            ErrorMessage="This League Name already exists" ForeColor="Red" OnServerValidate="ValidateLeagueName_ServerValidate"></asp:CustomValidator>
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