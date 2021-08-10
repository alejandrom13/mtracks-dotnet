using System;
using DataAccess;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


public partial class ArtistDetails : System.Web.UI.Page
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

            //Read more
            string bio = (string)data.Tables[0].Rows[0]["biography"];
            string[] pars = Regex.Split(bio, "<!-- read more -->");
            artistBio1.InnerText = pars[0].ToString();
            artistBio2.InnerText = pars[1].ToString();

            //Image url
            imgUrl.ImageUrl = (string)data.Tables[0].Rows[0]["imageURL"];

            //Hero url
            heroUrl.ImageUrl = (string)data.Tables[0].Rows[0]["heroURL"];

            //Select top 3 songs of artist
            topSongs.DataSource = data.Tables[1];
            topSongs.DataBind();

            //Select top 6 albums of artist
            topAlbums.DataSource = data.Tables[2];
            topAlbums.DataBind();

        }
        catch
        {
            imgUrl.ImageUrl = mt.notFoundImgURL;
            heroUrl.ImageUrl = mt.notFoundHeroURL;
        }


    }

}