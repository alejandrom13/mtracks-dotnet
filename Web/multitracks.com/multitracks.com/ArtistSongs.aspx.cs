using System;
using DataAccess;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


public partial class ArtistSongs : System.Web.UI.Page
{
    public dynamic sql;
    public string Id = "";
    MultitracksPage mt = new MultitracksPage();

    protected void Page_Load(object sender, EventArgs e)
    {
        sql = new SQL();
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

            SelectTopSongs();//Select all songs of artist

        }
        catch
        {
            imgUrl.ImageUrl = mt.notFoundImgURL;
            heroUrl.ImageUrl = mt.notFoundHeroURL;
        }
    }

    public void SelectTopSongs()
    {
        sql = new SQL();
        var Id = Request.QueryString["Id"];
        sql.Parameters.Add("@Id", Id);
        var top = sql.ExecuteStoredProcedureDS("GetAllArtistSongs");
        topSongs.DataSource = top;
        topSongs.DataBind();
    }
}