<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="EmployeeDetails.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-top: 4px;
            margin-right: 0px;
        }
    </style>
</head>
<body class="bg-dark">
         <div class="container" >
          <form id="form1" runat="server"  class=" border border-3 border-info rounded-3 h-100 alert alert-success p-3 w-100" style="height:100%; overflow-x: scroll;">
              <h2 class="text-center alert alert-warning border-0 w-100"> Employee Register...</h2>
              <table style="margin-left:35%" class="p-2 fw-bold">                
                <tr>
                    <td>Employee Name<asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label></td>    
                    <td><asp:TextBox ID="txtename" runat="server" class="rounded-2 border-info m-lg-1" ValidationGroup="Insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtename" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fields are mandatory." ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>                  
                </tr>
                <tr>
                    <td><asp:Label ID="lbldesig" runat="server" Text="Designation" class="p-2 fw-bold mt-3"></asp:Label></td>
                    <td><asp:DropDownList ID="ddlDesign" runat="server"  class="rounded-2 border-info m-lg-1" Width="189px">
                        <asp:ListItem Value="Select" Enabled="true" />
                         <asp:ListItem Text="CEO" />
                        <asp:ListItem Text="CTO" />
                        <asp:ListItem Text="Product Manager" />
                        <asp:ListItem Text="VP of Marketing" />
                        </asp:DropDownList>&nbsp; </td>
                </tr>
                <tr>
                    <td>&nbsp; Salary<asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="txtsal" runat="server" class="rounded-2 border-info m-lg-1" ValidationGroup="Insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtsal" runat="server" ErrorMessage="Fields are mandatory." ForeColor="Red" ValidationGroup="Insert"></asp:RequiredFieldValidator>                    
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Only Numeric Values" ControlToValidate="txtsal" ValidationExpression="^[1-9]\d*(\.\d+)?$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; Email<asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="txtemail" runat="server"  class="rounded-2 border-info m-lg-1" ValidationGroup="Insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtemail" runat="server" ErrorMessage="Fields are mandatory." ForeColor="Red" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>                      
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="txtemail" runat="server" ErrorMessage="Email is not Valid" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; Mobile<asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                    </td>
                   
                    <td><asp:TextBox ID="txtmob" runat="server" class="rounded-2 border-info m-lg-1" ValidationGroup="Insert"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtmob" runat="server" ErrorMessage="Fields are mandatory." ForeColor="Red" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>                        
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[789]\d{9}$" ControlToValidate="txtmob" runat="server" ErrorMessage="Digits Start With 7 or 8 or 9" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblqul" runat="server" Text="Qualification" class="p-2 fw-bold"></asp:Label></td>
                    <td><asp:DropDownList ID="ddlQualification" runat="server"  class="rounded-2 border-info m-lg-1" Width="189px">
                        <asp:ListItem Selected="True" Text="Select" />
                         <asp:ListItem Text="B Tech" />
                        <asp:ListItem Text="M Tech" />
                        <asp:ListItem Text="Intermediate" />
                        </asp:DropDownList></td>
                </tr>
                <tr>                 
                    <td><asp:Label ID="lblmanager" runat="server" Text="Manager" class="p-2 fw-bold"></asp:Label></td>
                    <td><asp:TextBox ID="txtmanager" runat="server" class="rounded-2 border-info m-lg-1" ValidationGroup="Insert"></asp:TextBox>                    
                    </td>
                </tr>
                <tr>
                      <td colspan="2">
                      <asp:Button ID="btnInsert" runat="server" Text="Insert" class="btn btn-outline-info p-1 m-1 rounded-2" style="width:20%" OnClick="btnInsert_Click" ValidationGroup="Insert" />                                          
                        <asp:Button ID="btnreset" runat="server" Text="Reset" class="btn btn-outline-warning p-1 m-1 rounded-2" style="width:20%"  ValidationGroup="Reset" OnClick="btnreset_Click" />                                          
                    </td>
                </tr>
                  <tr colspan="2">
                      <td><asp:Label ID="lblResult" runat="server" Text=" " /></td>
                  </tr>
            </table>
              <br />
              <h2 class="text-center alert alert-warning border-0 w-100"> Employee Information...</h2>
                <div class="row justify-content-center align-items-center">
                    <asp:GridView ID="gvEmployee" runat="server" Width="1249px" CellPadding="4" ForeColor="#333333"  AutoGenerateColumns="false" AutoGenerateDeleteButton="True"  CssClass="auto-style1" Height="149px" AutoGenerateEditButton="True" OnRowCancelingEdit="gvEmployee_RowCancelingEdit" OnRowDeleting="gvEmployee_RowDeleting" OnRowEditing="gvEmployee_RowEditing" OnRowUpdating="gvEmployee_RowUpdating">
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />

                    <AlternatingRowStyle BackColor="White" />

                    <Columns>
                         <asp:TemplateField HeaderText="EmpId">
                            <ItemTemplate><asp:Label ID="lblEid" Text='<%#Eval("EmpId")%>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:Label ID="lblid" runat="server" Text='<%#Eval("EmpId")%>'></asp:Label> </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ename">
                            <ItemTemplate><asp:Label ID="lblEname" Text='<%#Eval("EmpName")%>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txtEname" runat="server" Text='<%#Eval("EmpName")%>'></asp:TextBox> </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Designation">
                            <ItemTemplate><asp:Label ID="lblDes" Text='<%#Eval("Designation") %>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txtDesignation" runat="server" Text='<%#Eval("Designation")%>'></asp:TextBox> </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Salary">
                            <ItemTemplate><asp:Label ID="lblSal" Text='<%#Eval("Salary") %>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txtSalary" runat="server" Text='<%#Eval("Salary")%>'></asp:TextBox> </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate><asp:Label ID="lblEmail" Text='<%#Eval("Email") %>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("Email")%>'></asp:TextBox> </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate><asp:Label ID="lblMobile" Text='<%#Eval("Mobile") %>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txtMobile" runat="server" Text='<%#Eval("Mobile")%>'></asp:TextBox> </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Qualification">
                            <ItemTemplate><asp:Label ID="lblQual" Text='<%#Eval("Qualification") %>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txtQual" runat="server" Text='<%#Eval("Qualification")%>'></asp:TextBox> </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Manager">
                            <ItemTemplate><asp:Label ID="lblManager" Text='<%#Eval("Manager") %>' runat="server" /></ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="txtManager" runat="server" Text='<%#Eval("Manager")%>'></asp:TextBox> </EditItemTemplate>
                        </asp:TemplateField>                      
                    </Columns>
              </asp:GridView>
                </div>
          </form>

      </div>
       
</body>
</html>
