<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TeamUC.ascx.cs" Inherits="GolfLeague.UC.TeamUC" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <asp:TextBox ID="txtDivisionID" runat="server" Visible="false" />
        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped table-condensed" runat="server" AutoGenerateColumns="false"
            DataSourceID="SqlDataSource1" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowCommand="GridView1_RowCommand" 
            EmptyDataText="No records has been added." AllowSorting="true">
            <Columns>
                <asp:BoundField DataField="TeamName" HeaderText="Team" SortExpression="TeamName" />
                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="100px"
                    ShowEditButton="True" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="100px"
                    ShowDeleteButton="True" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
                 <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="75px"
                    ShowSelectButton="True" CausesValidation="false" />
            </Columns>
        </asp:GridView>

        <div class="form-inline">
            <label for="txtTeamName">Team Name:</label>
            <asp:TextBox CssClass="form-control" ID="txtTeamName" runat="server" />

            <asp:Button CssClass="btn btn-default" ID="btnAdd" runat="server" Text="Add New" OnClick="Insert" />
            <div class="form-group">
                <asp:RequiredFieldValidator ID="RequireTeamName" ControlToValidate="txtTeamName" runat="server" Display="Dynamic"
                    ErrorMessage="Team Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="ValidateTeamName" ControlToValidate="txtTeamName" runat="server" Display="Dynamic"
                    ErrorMessage="This Team Name already exists" ForeColor="Red" OnServerValidate="ValidateTeamName_ServerValidate"></asp:CustomValidator>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GolfLeagueDBConnString %>"
            SelectCommand="SELECT ID, TeamName FROM dbo.Team WHERE DivisionID = @DivisionID ORDER BY TeamName"
            InsertCommand="INSERT INTO dbo.Team (ID, DivisionID, TeamName) VALUES (NewID(), @DivisionID, @TeamName)"
            UpdateCommand="UPDATE dbo.Team SET TeamName = @TeamName WHERE ID = @ID"
            DeleteCommand="DELETE FROM dbo.Team WHERE ID = @ID">
            <SelectParameters>
                <asp:ControlParameter Name="DivisionID" ControlID="txtDivisionID" />
            </SelectParameters>
            <InsertParameters>
                <asp:ControlParameter Name="TeamName" ControlID="txtTeamName" Type="String" />
                <asp:ControlParameter Name="DivisionID" ControlID="txtDivisionID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="Object" />
                <asp:Parameter Name="TeamName" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Object" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </ContentTemplate>
</asp:UpdatePanel>