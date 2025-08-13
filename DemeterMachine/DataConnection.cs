using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DemeterMachine;
using MySql.Data.MySqlClient;

public class DataConnection
{
    public static MySqlConnection CreateConnection()
    {

        //string connectionString = "Server=127.0.0.1;Port=3306;Database=agridealership;Uid=root;Pwd=";
        string connectionString = $"Server=localhost;Port=3306;Database=agridealership;Uid=root;Pwd=";

        MySqlConnection conn = new MySqlConnection(connectionString);

        return conn;

    }

    public static MySqlCommand CreateCommand(MySqlConnection conn)
    {
        MySqlCommand cmd = conn.CreateCommand();
        return cmd;
    }

    public MySqlDataReader ExecuteReader(MySqlCommand cmd)
    {
        return cmd.ExecuteReader();
    }

    public void CloseConnection(MySqlConnection conn)
    {
        conn.Close();
    }

}
