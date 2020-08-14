<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CustomerExport.aspx.cs" Inherits="ExportGridViewToExcel.CustomerExport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="repCustomers" runat="server">
        <HeaderTemplate>
            <table cellspacing="0" cellpadding="5" rules="all" border="1" id="gvDetails" style="border-collapse: collapse;">
                <tr style="color: White; background-color: #DF5015; font-weight: bold;">
                    <th scope="col">
                        CustomerID
                    </th>
                    <th>
                        CompanyName
                    </th>
                    <th>
                        ContactName
                    </th>
                    <th>
                        ContactTitle
                    </th>
                    <th>
                        Address
                    </th>
                    <th>
                        City
                    </th>
                    <th>
                        Country
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).CustomerID%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).CompanyName%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).ContactName%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).ContactTitle%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).Address%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).City%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).Country%>
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).CustomerID%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).CompanyName%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).ContactName%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).ContactTitle%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).Address%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).City%>
                </td>
                <td>
                    <%# ((ExportGridViewToExcel.Customer)Container.DataItem).Country%>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <table>
        <tr style="width: 100%">
            <td style="padding-left: 300px">
                <asp:PlaceHolder ID="plcPaging" runat="server" />
            </td>
        </tr>
    </table>
    <asp:Button ID="btnExportExcel" runat="server" Text="Export to Excel" OnClick="btnExcel_Click" />
    <asp:Button ID="btnExportAllCustomer" runat="server" Text="Export All Customers to Excel"
        OnClick="btnExportAllCustomer_Click" />
</asp:Content>
