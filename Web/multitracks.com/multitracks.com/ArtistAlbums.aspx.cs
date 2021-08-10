using System;
using DataAccess;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


public partial class ArtistAlbums : System.Web.UI.Page
{
    public string Id = "";
    MultitracksPage mt = new MultitracksPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Id = Request.QueryString["Id"];

        try
        {
            var sql = new SQL();
            sql.Parameters.Add("@Id", Id);
            var data = sql.ExecuteStoredProcedureDS("GetArtistDetails");
            artistName.InnerText = data.Tables[0].Rows[0]["title"].ToString();

            //Image url
            imgUrl.ImageUrl = (string)data.Tables[0].Rows[0]["imageURL"];

            //Hero url
            heroUrl.ImageUrl = (string)data.Tables[0].Rows[0]["heroURL"];

            //Select all albums of artist
            SelectAllAlbums();

        }
        catch
        {
            imgUrl.ImageUrl = mt.notFoundImgURL;
            heroUrl.ImageUrl = mt.notFoundHeroURL;
        }
    }

    public void SelectAllAlbums()
    {
        var sql = new SQL();
        var Id = Request.QueryString["Id"];
        sql.Parameters.Add("@Id", Id);
        var top = sql.ExecuteStoredProcedureDS("GetAllArtistAlbums");

        topAlbums.DataSource = top;
        topAlbums.DataBind();
    }
}