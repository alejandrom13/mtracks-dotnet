using DataAccess;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api.multitracks.com.Controllers
{
    [ApiController]
    public class SongController : ControllerBase
    {
        public dynamic sql;

        [HttpGet]
        [Route("song/list")]
        public ContentResult ListAllSongs(int PageNumber, int PageSize)
        {
            try
            {
                sql = new SQL();
                sql.Parameters.Add("@PageNumber", PageNumber);
                sql.Parameters.Add("@PageSize", PageSize);
                var data = sql.ExecuteStoredProcedureDT("ListAllSongs");
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
    }
}
