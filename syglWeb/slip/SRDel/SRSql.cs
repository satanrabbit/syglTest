using System;
using System.Collections.Generic;
using System.Web;

using System.Data;
using System.Data.OleDb;
using System.Configuration;


namespace syglWeb.slip.SRDel
{
    public class SRSql
    {
        public SRSql() {
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
    }
}