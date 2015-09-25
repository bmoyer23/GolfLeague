<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DivisionUC.ascx.cs" Inherits="GolfLeague.UC.DivisionUC" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <asp:TextBox ID="txtLeagueID" runat="server" Visible="false" />
        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped table-condensed" runat="server" AutoGenerateColumns="false"
            DataSourceID="SqlDataSource1" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowCommand="GridView1_RowCommand" 
            EmptyDataText="No records has been added." AllowSorting="true">
            <Columns>
                <asp:BoundField DataField="DivisionName" HeaderText="Division" SortExpression="DivisionName" />
                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-sm btn-default" ItemStyle-Width="50px"
                    ShowEditButton="True" EditText="<i aria-hidden='true' class='glyphicon glyphicon-pencil'></i>" />
                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-sm btn-default" ItemStyle-Width="50px"
                    ShowDeleteButton="True" DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="75px"
                    ShowSelectButton="True" SelectText="Teams" CausesValidation="false" />
            </Columns>
        </asp:GridView>

        <div class="form-inline">
            <label for="txtDivisionName">Division Name:</label>
            <asp:TextBox CssClass="form-control" ID="txtDivisionName" runat="server" />

            <asp:Button CssClass="btn btn-default" ID="btnAdd" runat="server" Text="Add New" OnClick="Insert" />
            <div class="form-group">
                <asp:RequiredFieldValidator ID="RequireDivisionName" ControlToValidate="txtDivisionName" runat="server" Display="Dynamic"
                    ErrorMessage="Division Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="ValidateDivisionName" ControlToValidate="txtDivisionName" runat="server" Display="Dynamic"
                    ErrorMessage="This Division Name already exists" ForeColor="Red" OnServerValidate="ValidateDivisionName_ServerValidate"></asp:CustomValidator>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GolfLeagueDBConnString %>"
            SelectCommand="SELECT D.ID, DivisionName, LeagueName FROM dbo.Division AS D INNER JOIN dbo.League AS L ON D.LeagueID = L.ID WHERE LeagueID = @LeagueID ORDER BY DivisionName"
            InsertCommand="INSERT INTO dbo.Division (ID, LeagueID, DivisionName) VALUES (NewID(), @LeagueID, @DivisionName)"
            UpdateCommand="UPDATE dbo.Division SET DivisionName = @DivisionName WHERE ID = @ID"
            DeleteCommand="DELETE FROM dbo.Division WHERE ID = @ID">
            <SelectParameters>
                <asp:ControlParameter Name="LeagueID" ControlID="txtLeagueID" />
            </SelectParameters>
            <InsertParameters>
                <asp:ControlParameter Name="DivisionName" ControlID="txtDivisionName" Type="String" />
                <asp:ControlParameter Name="LeagueID" ControlID="txtLeagueID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="Object" />
                <asp:Parameter Name="DivisionName" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Object" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </ContentTemplate>
</asp:UpdatePanel>