using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Files
/// </summary>
public class Files
{
    public static Files resume;
    public static Files transcript;
    private int fileID;
    private string fileName, fileType, uploadType;
    private byte[] data;
    public Files()
    {
        
    }
    public Files(int fileID, string fileName, string fileType, string uploadType, byte[] data)
    {
        this.fileID = fileID;
        this.fileName = fileName;
        this.fileType = fileType;
        this.uploadType = uploadType;
        this.data = data;
    }
    //Getters
    public int getFileID() { return this.fileID; }
    public string getFileName() { return this.fileName; }
    public string getFileType() { return this.fileType; }
    public string getUploadType() { return this.uploadType; }
    public byte[] getData()
    {
        byte[] returnByte = this.data.ToArray();
        return returnByte;
    }
    //Setters
    public void setFileID(int ID) { this.fileID = ID; }
    public void setFileName(string name) { this.fileName = name; }
    public void setFileType(string type) { this.fileType = type; }
    public void setUploadType(string uType) { this.uploadType = uType; }
    public void setData(byte[] data) { this.data = data; }
}
