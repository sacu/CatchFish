namespace Sacu.Utils
{
    public class SALuaStringBuffer
    {
        //从lua端读取协议数据
        public SALuaStringBuffer(System.IntPtr source, int len)
        {
            buffer = new byte[len];
            System.Runtime.InteropServices.Marshal.Copy(source, buffer, 0, len);
        }

        //c#端创建协议数据
        public SALuaStringBuffer(byte[] buf)
        {
            this.buffer = buf;
        }

        public byte[] buffer = null;
    }
}