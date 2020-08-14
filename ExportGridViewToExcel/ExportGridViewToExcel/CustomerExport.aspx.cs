using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ExportGridViewToExcel
{
    public partial class CustomerExport : System.Web.UI.Page
    {
        private const int PageSize = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            plcPaging.Controls.Clear();
            CreatePagingControl();
            if (!Page.IsPostBack)
            {
                FetchData(1);
            }
        }

        private void CreatePagingControl()
        {
            int rowCount = CustomerService.GetCustomerCount();
            rowCount = (rowCount / PageSize) + 1;

            for (int i = 0; i < rowCount; i++)
            {
                LinkButton lnk = new LinkButton();
                lnk.Click += new EventHandler(lbl_Click);
                lnk.ID = "lnkPage" + (i + 1).ToString();
                lnk.Text = (i + 1).ToString();
                plcPaging.Controls.Add(lnk);
                Label spacer = new Label();
                spacer.Text = "&nbsp;";
                plcPaging.Controls.Add(spacer);
            }
        }


        void lbl_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            int currentPage = int.Parse(lnk.Text);

            FetchData(currentPage);
        }

        private void FetchData(int pageIndex)
        {
            repCustomers.DataSource = CustomerService.GetAllCustomers(pageIndex - 1, PageSize);
            repCustomers.DataBind();
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Customers.xls");
            Response.ContentType = "applicatio/excel";
            StringWriter sw = new StringWriter(); ;
            HtmlTextWriter htm = new HtmlTextWriter(sw);
            repCustomers.RenderControl(htm);
            Response.Write(sw.ToString());
            Response.End();
        }

        protected void btnExportAllCustomer_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Customers.xls");
            Response.ContentType = "applicatio/excel";
            StringWriter sw = new StringWriter(); ;
            HtmlTextWriter htm = new HtmlTextWriter(sw);

            Repeater repAllCustomers = this.repCustomers;
            repAllCustomers.DataSource = CustomerService.GetAllCustomers(0, CustomerService.GetCustomerCount());
            repAllCustomers.DataBind();
            repAllCustomers.RenderControl(htm);

            Response.Write(sw.ToString());
            Response.End();
        }
    }
}