using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemeterMachine
{
    public partial class serviceRecords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
           // GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

        }


        protected void GridView1_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {
            e.DataMethodsObject = new DemeterMachine.service_records();
        }

        protected void DetailsView1_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {

        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {

        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {

        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {

        }

        protected void DetailsView1_CallingDataMethods1(object sender, CallingDataMethodsEventArgs e)
        {

        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormView1.DataBind();
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.Insert)
            {
                FormView1.ChangeMode(FormViewMode.Insert);
            }
        }
    }
}