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

        #region 保存旧的项目类型
        public int SaveOldType(oldType ot)
        {
            conn.Open();
            if (ot.typeID == 0)
            {
                cmd.CommandText = "insert into opTypeTB  (typeIndex,typeName) values(@typeIndex,@typeName)";
                cmd.Parameters.AddWithValue("@typeIndex", ot.typeIndex);
                cmd.Parameters.AddWithValue("@typeName", ot.typeName);
                cmd.ExecuteNonQuery();
                cmd.CommandText = "SELECT @@Identity ";
                ot.typeID = (int)cmd.ExecuteScalar();
            }
            else
            {
                cmd.CommandText = "update  opTypeTB set typeIndex=@typeIndex,typeName=@typeName  where typeID=@typeID";
                cmd.Parameters.AddWithValue("@typeIndex", ot.typeIndex);
                cmd.Parameters.AddWithValue("@typeName", ot.typeName);
                cmd.Parameters.AddWithValue("@typeID", ot.typeID);
                cmd.ExecuteNonQuery();
            }
            conn.Close();
            return ot.typeID;
        }
        #endregion

        #region 删除旧的项目类型
        public int DeleteOldType(string ids)
        {
            conn.Open();
            cmd.CommandText = "delete from opTypeTB where typeID in ( " + ids + ") ";
            int effects = cmd.ExecuteNonQuery();
            conn.Close();
            return effects;
        }
        #endregion

        #region 获取以往项目的列表
        /// <summary>
        /// 获取以往项目列表，带有总数目
        /// </summary>
        /// <param name="opType">旧项目分类</param>
        /// <param name="page">页数</param>
        /// <param name="pageSize">每页数量</param>
        /// <param name="sort">排序元</param>
        /// <param name="sordtOrder">排序顺序</param>
        /// <returns></returns>
        public oldProjectWithtotal GetProjectsWithTotal(int opType,int page,int pageSize,string sort,string sordtOrder)
        {
            string optype_;
            if (opType == 0)
            {
                optype_ =  " ";
            }
            else
            {
                optype_ = " and  opType = " + opType.ToString() + " ";
            }
            oldProjectWithtotal opt = new oldProjectWithtotal();
            conn.Open();
            cmd.CommandText = "select count(opID) from oldProjects_tb where 1 = 1 " + optype_;
            opt.total =Convert.ToInt32( cmd.ExecuteScalar());
            if (page == 1)
            {
                //cmd.CommandText = "select * from oldProjects_tb where opType=" + optype_;
                cmd.CommandText = "select top " + pageSize +
                         "  oldProjects_tb.opID,oldProjects_tb.opTitle,oldProjects_tb.opImg,oldProjects_tb.opIntro,oldProjects_tb.opYear,oldProjects_tb.opLeader,oldProjects_tb.opType,opTypeTB.typeName from ( oldProjects_tb left join opTypeTB on oldProjects_tb.opType=opTypeTB.typeID  ) where  1=1 " 
                         + optype_+" order by "
                         + sort + " " + sordtOrder + " ";

            }
            else
            {
                cmd.CommandText = "select top " + pageSize +
                           "   oldProjects_tb.opID,oldProjects_tb.opTitle,oldProjects_tb.opImg,oldProjects_tb.opIntro,oldProjects_tb.opYear,oldProjects_tb.opLeader,oldProjects_tb.opType,opTypeTBtypeName  from  (oldProjects_tb left join opTypeTB on oldProjects_tb.opType=opTypeTB.typeID ) where  1=1 "
                         + optype_ + " and  opID not in ( select top " + (page - 1) * pageSize +
                           " and  opID from oldProjects_tb   order by " + sort + " " + sordtOrder + " )  order by " + sort + " " + sordtOrder + " ";
            }
            dr = cmd.ExecuteReader();
            List<oldProject> oplist = new List<oldProject>();
            while (dr.Read())
            {
                oldProject op = new oldProject();
                op.opID = Convert.ToInt32(dr["opID"]);
                op.opTitle = dr["opTitle"].ToString();
                op.opYear = dr["opYear"].ToString();
                op.opLeader = dr["opLeader"].ToString();
                op.opType = Convert.ToInt32(dr["opType"]);
                op.opTypeName = dr["typeName"].ToString();
                op.opImg = dr["opImg"].ToString().Trim();
                op.opIntro = dr["opIntro"].ToString();
                oplist.Add(op);                
            }
            conn.Close();
            opt.rows = oplist;
            return opt;
        }
        #endregion

        #region 获取指定id的往届项目
        public oldProject GetOldProject(int opid)
        {
            oldProject op = new oldProject();
            conn.Open();
            cmd.CommandText = "select * from( oldProjects_tb left join opTypeTB on oldProjects_tb.opType=opTypeTB.typeID )where opID=" + opid;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                op.opContent = dr["opContent"].ToString();
                op.opDepartment = dr["opDepartment"].ToString();
                op.opEmail = dr["opEmail"].ToString();
                op.opID = opid;
                op.opImg = dr["opImg"].ToString();
                op.opIntro = dr["opIntro"].ToString();
                op.opLeader = dr["opLeader"].ToString();
                op.opNum = dr["opNum"].ToString();
                op.opTitle = dr["opTitle"].ToString();
                op.opType = Convert.ToInt32(dr["opType"]);
                op.opTypeName = dr["TypeName"].ToString();
                op.opYear = dr["opYear"].ToString();
            }
            conn.Close();
            return op;
        }
        #endregion

        #region 保存旧的项目
        public int SaveOldProject(oldProject op)
        {
            conn.Open();
            if (op.opID == 0)
            {
                //添加 

                cmd.CommandText = "insert into oldProjects_tb  (opContent,opDepartment,opEmail,opImg,opIntro,opLeader,opNum,opTitle,opType,opYear) "
                    + " values(@opContent,@opDepartment,@opEmail,@opImg,@opIntro,@opLeader,@opNum,@opTitle,@opType,@opYear)";
                cmd.Parameters.AddWithValue("@opContent", op.opContent);
                cmd.Parameters.AddWithValue("@opDepartment", op.opDepartment);
                cmd.Parameters.AddWithValue("@opEmail", op.opEmail);
                cmd.Parameters.AddWithValue("@opImg", op.opImg);
                cmd.Parameters.AddWithValue("@opIntro", op.opIntro);
                cmd.Parameters.AddWithValue("@opLeader", op.opLeader);
                cmd.Parameters.AddWithValue("@opNum", op.opNum);
                cmd.Parameters.AddWithValue("@opTitle", op.opTitle);
                cmd.Parameters.AddWithValue("@opType", op.opType);
                cmd.Parameters.AddWithValue("@opYear", op.opYear);

                cmd.ExecuteNonQuery();
                cmd.CommandText = "SELECT @@Identity ";
                op.opID = (int)cmd.ExecuteScalar();
            }
            else
            {
                //修改
                cmd.CommandText = "update  oldProjects_tb set opContent=@opContent,opDepartment=@opDepartment,opEmail=@opEmail,opImg=@opImg,opIntro=@opIntro,opLeader=@opLeader,opNum=@opNum,opTitle=@opTitle,opType=@opType,opYear=@opYear "
                   + " where opID=@opID ";
                cmd.Parameters.AddWithValue("@opContent", op.opContent);
                cmd.Parameters.AddWithValue("@opDepartment", op.opDepartment);
                cmd.Parameters.AddWithValue("@opEmail", op.opEmail);
                cmd.Parameters.AddWithValue("@opImg", op.opImg);
                cmd.Parameters.AddWithValue("@opIntro", op.opIntro);
                cmd.Parameters.AddWithValue("@opLeader", op.opLeader);
                cmd.Parameters.AddWithValue("@opNum", op.opNum);
                cmd.Parameters.AddWithValue("@opTitle", op.opTitle);
                cmd.Parameters.AddWithValue("@opType", op.opType);
                cmd.Parameters.AddWithValue("@opYear", op.opYear);
                cmd.Parameters.AddWithValue("@opID", op.opID);
                cmd.ExecuteNonQuery();
            }
            conn.Close();
            return op.opID;
        }
        #endregion

        #region 删除旧的项目
        public int DeleteOldProject(string ids)
        {
            conn.Open();
            cmd.CommandText = "delete from oldProjects_tb where opID in ( " + ids + ") ";
            int effects = cmd.ExecuteNonQuery();
            conn.Close();
            return effects; 
        }
        #endregion

        #region 获取项目支持列表
        public SupportListWithTotal GetSupportList()
        {
            SupportListWithTotal splt = new SupportListWithTotal();
            conn.Open();
            cmd.CommandText = "select count(supportID) from supportTB ";
            splt.total = Convert.ToInt32(cmd.ExecuteScalar());
            cmd.CommandText = "select supportID , supportTitle from supportTB order by supportID";
            dr = cmd.ExecuteReader();
            List<Support> spl = new List<Support>();
            while (dr.Read())
            {
                Support sp = new Support();
                sp.supportID = Convert.ToInt32(dr["supportID"]);
                sp.supportTitle = dr["supportTitle"].ToString();
                spl.Add(sp);
            }
            splt.rows = spl;
            conn.Close();
            return splt;
        }
        #endregion
        #region 获取指定项目支持
        public Support GetSupport(int id)
        {
            Support sp = new Support();
            conn.Open();
            cmd.CommandText = "select * from supportTB where supportID= "+id.ToString();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                sp.supportID = Convert.ToInt32(dr["supportID"]);
                sp.supportTitle = dr["supportTitle"].ToString();
                sp.supportContent = dr["supportContent"].ToString();
            }
            conn.Close();
            return sp;

        }
        #endregion
        #region 保存项目支持
        public void SaveSupport(Support spt)
        {
            conn.Open();
            cmd.CommandText = "update  supportTB set supportContent=@supportContent   where supportID=@supportID";
            cmd.Parameters.AddWithValue("@supportContent", spt.supportContent); 
            cmd.Parameters.AddWithValue("@supportID", spt.supportID);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        #endregion
        #region 获取指定帐号的管理员
        public Admin GetAdmin(string adminAccount)
        {
            Admin admin_tb = new Admin();
            conn.Open();
            cmd.CommandText = "select * from adminTB where adminAccount = '" + adminAccount+"'";
            dr = cmd.ExecuteReader();
            if(dr.Read()){
                admin_tb.adminAcount = dr["adminAccount"].ToString();
                admin_tb.adminID =Convert.ToInt32( dr["adminID"]);
                admin_tb.adminIdentity = Convert.ToInt32(dr["adminIdentity"]);
                admin_tb.adminName = dr["adminName"].ToString();
                admin_tb.adminPWD = dr["adminPWD"].ToString();
                admin_tb.adminRemark = dr["adminRemark"].ToString();
            }
            conn.Close();
            return admin_tb;
        }
        #endregion

    }
    #region 新闻类
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
    #endregion
    #region 带总数数的新闻列表类
    /// <summary>
    /// 带总数数的新闻列表类
    /// </summary>
    public class listNewsWithPages
    {
        public List<News> newsList { get;set;}
        public int Total { get; set; }
    }
    #endregion
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
    /// <summary>
    /// 旧项目
    /// </summary>
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
        public string opIntro { get; set; }
    }
    /// <summary>
    /// 带有总数量的旧项目列表
    /// </summary>
    public class oldProjectWithtotal
    {
        public List<oldProject> rows { get; set; }
        public int total { get; set; }
    }

    #endregion

    #region 项目支持
    public class Support
    {
        public int supportID { get; set; }
        public string supportTitle { get; set; }
        public string supportContent { get; set; }
    }

    public class SupportListWithTotal {
        public int total { get; set; }
        public List<Support> rows { get; set; }
    }
    #endregion

    #region 管理员
    public class Admin
    {
        public int adminID { get; set; }
        public string adminAcount { get; set; }
        public string adminPWD { get; set; }
        public int adminIdentity { get; set; }
        public string adminName { get; set; }
        public string adminRemark { get; set; }
    }
    #endregion
}