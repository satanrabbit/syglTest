using System;
using System.Collections.Generic;
using System.Web;

using System.Data;
using System.Data.OleDb;
using System.Configuration;


namespace syglWeb.slip_
{
    public class DataModal
    {
         public DataModal(){
            connStr = ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString;
            conn = new OleDbConnection(connStr);
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            da = new OleDbDataAdapter(cmd);
            ds = new DataSet();
        }
        public OleDbConnection conn{get;set;}
        public string connStr { get; set; }
        public OleDbCommand cmd { get; set; }

        public DataSet ds{get;set;}
        public OleDbDataReader dr { get; set; }
        public OleDbDataAdapter da { get; set; }

        #region 获取新闻的列表
        /// <summary>
        /// 获取文章列表
        /// </summary>
        /// <param name="page">第几页</param>
        /// <param name="pageSize">每页数量</param>
        /// <param name="sort">排序元</param>
        /// <param name="order">desc或asc</param>
        /// <returns></returns>
        public listNewsWithPages GetNewsList(int page, int pageSize, string sort, string order)
        {
            listNewsWithPages lnp = new listNewsWithPages();
            List<News> ns = new List<News>();
            conn.Open();
            if (page == 1)
            {
                cmd.CommandText = "select top " + pageSize +
                         "  newsID,newsTitle,newsPostTime from  newsTB  order by " + sort + " " + order + " ";
                
            }
            else
            {
                cmd.CommandText = "select top " + pageSize +
                           "  newsID,newsTitle,newsPostTime from  newsTB where  newsID not in ( select top " + (page - 1) * pageSize +
                           " newsID from newsTB   order by " + sort + " " + order + " )  order by " + sort + " " + order + " ";
              
            }
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                News n = new  News();
                n.newsID =Convert.ToInt32( dr["newsID"]);
                n.newsTitle = dr["newsTitle"].ToString();
                n.newsContent = "";
                n.newsPostTime = (DateTime)dr["newsPostTime"];
                ns.Add(n);
            }
            dr.Close();
            //查询页数
            cmd.CommandText = "select count(newsID) from newsTB";
            int tl = Convert.ToInt32(cmd.ExecuteScalar());
            lnp.Total = tl;
            conn.Close();
            lnp.newsList = ns;
            return lnp;
        }
        /// <summary>
        /// 获取文章列表
        /// </summary>
        /// <param name="page">第几页</param>
        /// <param name="pageSize">每页数量</param>
        /// <param name="sort">排序元</param> 
        /// <returns></returns>
        public listNewsWithPages GetNewsList(int page, int pageSize, string sort)
        {
            return GetNewsList(page, pageSize, sort, "desc");
        }
        /// <summary>
        /// 获取新闻列表和页数的
        /// </summary>
        /// <param name="page">第几页</param>
        /// <param name="pageSize">每页数量</param> 
        /// <returns> 带总页数的新闻列表</returns>
        public listNewsWithPages GetNewsList(int page, int pageSize)
        {

            return GetNewsList(page, pageSize, "newsPostTime", "desc");
        }
        /// <summary>
        /// 获取新闻列表和页数的
        /// </summary>
        /// <param name="page">第几页</param> 
        /// <returns> 带总页数的新闻列表</returns>
        public listNewsWithPages GetNewsList(int page)
        {
            return GetNewsList(page, 25, "newsPostTime", "desc");
        }
        /// <summary>
        /// 获取新闻列表和页数的
        /// </summary> 
        /// <returns> 带总页数的新闻列表</returns>
        public listNewsWithPages GetNewsList()
        {
            return GetNewsList(1, 25, "newsPostTime", "desc");
        }
        #endregion

        #region 获取新闻详细
        public News GetNewes(int id)
        {
            News n = new News();
            conn.Open();
            cmd.CommandText = "select * from newsTB where newsID="+id;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                n.newsID = Convert.ToInt32(dr["newsID"]);
                n.newsContent = Convert.ToString(dr["newsContent"]);
                n.newsPostTime = Convert.ToDateTime(dr["newsPostTime"]);
                n.newsTitle = Convert.ToString(dr["newsTitle"]);
            }
            conn.Close();
            return n;
        }
        #endregion

        #region 保存新闻内容
        public int SaveNews(News nw)
        {
            conn.Open();
            if (nw.newsID == 0)
            {
                cmd.CommandText = "insert into newsTB  (newsTitle,newsPostTime,newsContent) values(@newsTitle,@newsPostTime,@newsContent)";
                cmd.Parameters.AddWithValue("@newsTitle", nw.newsTitle);
                cmd.Parameters.AddWithValue("@newsPostTime", nw.newsPostTime);
                cmd.Parameters.AddWithValue("@newsContent", nw.newsContent);
                cmd.ExecuteNonQuery();
                cmd.CommandText = "SELECT @@Identity ";
                nw.newsID = (int)cmd.ExecuteScalar();
            }
            else
            {
                cmd.CommandText = "update  newsTB set newsTitle=@newsTitle,newsPostTime=@newsPostTime,newsContent=@newsContent where newsID=@newsID";
                cmd.Parameters.AddWithValue("@newsTitle", nw.newsTitle);
                cmd.Parameters.AddWithValue("@newsPostTime", nw.newsPostTime);
                cmd.Parameters.AddWithValue("@newsContent", nw.newsContent);
                cmd.Parameters.AddWithValue("@newsID", nw.newsID);
                cmd.ExecuteNonQuery();
            }
            conn.Close();
            return nw.newsID;
        }
        #endregion

        #region 删除新闻
        public int DeleteNews(string nids )
        {
            conn.Open();
            cmd.CommandText = "delete from newsTB where newsID in ( " + nids + ") ";
            int effects = cmd.ExecuteNonQuery();
            conn.Close();
            return effects;
        }
        #endregion

        #region 获取以往分类项目列表
        public List<oldType> GetOldType()
        {
            List<oldType> ots = new List<oldType>();
            conn.Open();
            cmd.CommandText = "select * from opTypeTB order by typeIndex";
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                oldType ot = new oldType();
                ot.typeID =Convert.ToInt32( dr["typeID"]);
                ot.typeIndex=Convert.ToInt32(dr["typeIndex"]);
                ot.typeName = dr["typeName"].ToString();
                ots.Add(ot);
            }
            conn.Close();
            return ots;
        }
        #endregion

        #region 获取以往项目的列表
        public oldProjectWithtotal GetProjectsWithTotal(int opType,int page,int pageSize,string sort,string sordtOrder)
        {
            string optype_;
            if (opType == 0)
            {
                optype_ = "*";
            }
            else
            {
                optype_ = opType.ToString();
            }
            oldProjectWithtotal opt = new oldProjectWithtotal();
            conn.Open();
            cmd.CommandText = "select count(opID) from oldProjects_tb where opType=" + optype_;
            opt.total =Convert.ToInt32( cmd.ExecuteScalar());
            cmd.CommandText = "";
            conn.Close();
            return opt;
        }
        #endregion
    }
    /// <summary>
    /// 新闻类
    /// </summary>
    public class News 
    {
        public int newsID { get; set; }
        public string newsTitle { get; set; }
        public string newsContent { get; set; }
        public DateTime newsPostTime { get; set; }
    }
    /// <summary>
    /// 带总数数的新闻列表类
    /// </summary>
    public class listNewsWithPages
    {
        public List<News> newsList { get;set;}
        public int Total { get; set; }
    }

    #region 往届项目分类
    /// <summary>
    /// 往届项目分类
    /// </summary>
    public class oldType
    {
        public int typeID { get; set; }
        public string typeName { get; set; }
        public int typeIndex { get; set; }
    }
    #endregion

    #region 往届项目
    public class oldProject
    {
        public int opID { get; set; }
        public string opTitle { get; set; }
        public string opYear { get; set; }
        public string opContent { get; set; }
        public string opNum { get; set; }
        public string opLeader { get; set; }
        public string opEmail { get; set; }
        public string opDepartment { get; set; }
        public string opImg { get; set; }
        public int opType { get; set; }
        public string opTypeName{get;set;}
    }

    public class oldProjectWithtotal
    {
        public List<oldProject> rows { get; set; }
        public int total { get; set; }
    }

    #endregion
}