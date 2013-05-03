using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
namespace syglWeb.dj
{
    public class DjOledb
    {
        /// <summary>
        /// 封装dj数据处理常用对象
        /// </summary>
        public DjOledb()
        {
            connStr = ConfigurationManager.ConnectionStrings["djConnStr"].ConnectionString;
            conn = new OleDbConnection(connStr);
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            da = new OleDbDataAdapter();
            ds = new DataSet();
        }
        /// <summary>
        /// 连接字符串
        /// </summary>
        public  string connStr { get; set; }
        /// <summary>
        /// 连接对象
        /// </summary>
        public  OleDbConnection conn { get; set; }

        /// <summary>
        /// Command对象 
        /// </summary>
        public  OleDbCommand cmd { get; set; }
        /// <summary>
        /// 连接适配器
        /// </summary>
        public  OleDbDataAdapter da { get; set; }

        /// <summary>
        /// DataReader对象
        /// </summary>        
        public  OleDbDataReader dr { get; set; }

        /// <summary>
        /// DataSet对象
        /// </summary>
        public  DataSet ds { get; set; }
        
    }
}