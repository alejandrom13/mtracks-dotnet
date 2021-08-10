using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAccess;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace api.multitracks.com.Controllers
{
    [ApiController]
    public class ArtistController : ControllerBase
    {
        public dynamic sql;

        [HttpGet]
        [Route("artist/search")]
        public ContentResult SearchArtistByName(string ArtistName)
        {
            try
            {
                sql = new SQL();
                sql.Parameters.Add("@ArtistName", ArtistName);
                var data = sql.ExecuteStoredProcedureDT("SearchArtistByName");
                string JSON = string.Empty;
                JSON = JsonConvert.SerializeObject(data);

                return new ContentResult { Content = JSON, ContentType = "application/json" };
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
            return new ContentResult { Content = "", ContentType = "application/json" };
        }


        [HttpPost]
        [Route("artist/add")]
        public string AddArtist(string ArtistName, string biography, string imageURL, string heroURL)
        {

            try
            {
                sql = new SQL();
                sql.Parameters.Add("@ArtistName", ArtistName);
                sql.Parameters.Add("@biography", biography);
                sql.Parameters.Add("@imageURL", imageURL);
                sql.Parameters.Add("@heroURL", heroURL);
                sql.ExecuteStoredProcedureDT("AddArtist");

                return $"Artist: {ArtistName} was successfully inserted!";
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
            }
            return "Error";
        }


    }
}
