using System;
using System.Collections.Generic;
using System.Web;
using System.Security.Cryptography;

/// <summary>
/// MD5 的摘要说明
/// </summary>
public class PwdEncrypt
{
    public PwdEncrypt()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static string MD5Encrypt64(string num)
    {

        string pwd = num;
        MD5 md5 = MD5.Create();
        byte[] s = md5.ComputeHash(System.Text.Encoding.UTF8.GetBytes(num));
        return Convert.ToBase64String(s);
    }
}