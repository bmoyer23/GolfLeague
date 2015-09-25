<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlayerUC.ascx.cs" Inherits="GolfLeague.UC.PlayerUC" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <asp:TextBox ID="txtLeagueID" runat="server" Visible="false" />
        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped table-condensed" runat="server" AutoGenerateColumns="false"
            DataSourceID="SqlDataSource1" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowCommand="GridView1_RowCommand" 
            EmptyDataText="No records has been added." AllowSorting="true">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="HandicapIndex" HeaderText="Handicap" SortExpression="HandicapIndex" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="100px"
                    ShowEditButton="True" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="100px"
                    ShowDeleteButton="True" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" />
                 <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-default" ItemStyle-Width="75px"
                    ShowSelectButton="True" CausesValidation="false" />
            </Columns>
        </asp:GridView>

        <div class="form">
            <div class="form-group">
                <label for="txtFirstName">First Name:</label>
                <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server" />
                <asp:RequiredFieldValidator ID="RequireFirstName" ControlToValidate="txtFirstName" runat="server" Display="Dynamic"
                    ErrorMessage="First Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="ValidateFirstName" ControlToValidate="txtFirstName" runat="server" Display="Dynamic"
                    ErrorMessage="This First Name already exists" ForeColor="Red" OnServerValidate="ValidateFirstName_ServerValidate"></asp:CustomValidator>
            </div>
            <div class="form-group">
                <label for="txtLastName">Last Name:</label>
                <asp:TextBox CssClass="form-control" ID="txtLastName" runat="server" />
            </div>
            <div class="form-group">
            <label for="txtHandicap">Handicap:</label>
            <asp:TextBox CssClass="form-control" ID="txtHandicap" runat="server" />
            </div>
            <div class="form-group">
            <label for="txtEmail">Email:</label>
            <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" />
            </div>
            <div class="form-group">
            <label for="txtPhone">Phone:</label>
            <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" />
            </div>
            <div class="form-group">
            <asp:Button CssClass="btn btn-default" ID="btnAdd" runat="server" Text="Add New" OnClick="Insert" />
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GolfLeagueDBConnString %>"
            SelectCommand="SELECT P.ID, P.FirstName, P.LastName, P.HandicapIndex, P.Email, P.Phone, P.LeagueID FROM dbo.Player AS P WHERE LeagueID = @LeagueID ORDER BY LastName, FirstName"
            InsertCommand="INSERT INTO dbo.Player (ID, FirstName, LastName, HandicapIndex, Email, Phone, LeagueID) VALUES (NewID(), @FirstName, @LastName, @Handicap, @Email, @Phone, @LeagueID)"
            UpdateCommand="UPDATE dbo.Player SET FirstName = @FirstName, LastName = @LastName, HandicapIndex = @Handicap, Email = @Email, Phone = @Phone WHERE ID = @ID"
            DeleteCommand="DELETE FROM dbo.Player WHERE ID = @ID">
            <SelectParameters>
                <asp:ControlParameter Name="LeagueID" ControlID="txtLeagueID" />
            </SelectParameters>
            <InsertParameters>
                <asp:ControlParameter Name="FirstName" ControlID="txtFirstName" Type="String" />
                <asp:ControlParameter Name="LastName" ControlID="txtLastName" Type="String" />
                <asp:ControlParameter Name="Handicap" ControlID="txtHandicap" Type="String" />
                <asp:ControlParameter Name="Email" ControlID="txtEmail" Type="String" />
                <asp:ControlParameter Name="Phone" ControlID="txtPhone" Type="String" />
                <asp:ControlParameter Name="LeagueID" ControlID="txtLeagueID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="Object" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Handicap" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Object" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </ContentTemplate>
</asp:UpdatePanel>