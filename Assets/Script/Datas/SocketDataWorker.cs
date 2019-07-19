using System.Net.Sockets;
using System.Net;
using System;
using System.Text;


using Sacu.Factory.Worker;
using Sacu.Collection;
using Sacu.Utils;

using Google.ProtocolBuffers;

namespace Datas
{
    public class SocketDataWorker : SADataWorker
    {
        //#define PACKLENGTH(a,b) ((int)((((BYTE)(b)) << 8)) + (int)(a))
        private Socket _socket;//socket 对象

        private string _host;
        private int _port;


        private System.Random random;//随机种子

        private int msg_length;
        private byte[] socket_buffers;
        private int position;//游标

        private byte[] receive_buffers;
        private int receive_position;


        private static byte[] sampleBa;

        public SocketDataWorker(string name, string command)
            : base(name, command)
        {
            random = new System.Random();
            _socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            SAUtils.Log("Socket Init");
        }

        public void connect(string host = "127.0.0.1", int port = 0)
        {
            _host = host;
            _port = port;
            close();
            
            //端口及IP
            IPEndPoint ipe = new IPEndPoint(IPAddress.Parse(host), port);
            //创建套接字
            _socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            //开始连接到服务器
            _socket.BeginConnect(ipe, new AsyncCallback(connectComplete), null);

        }

        public bool getConnection()
        {
            return _socket != null ? _socket.Connected : false;
        }

        public string Host
        {
            get
            {
                return _host;
            }
        }
        public int Port
        {
            get
            {
                return _port;
            }
        }

        public void close()
        {
            if (_socket != null && _socket.Connected)
            {
                _socket.Close();
                _socket = null;
            }
        }

        public bool blockConnect(string host, int port)
        {
            if (_socket != null)
            {
                //关闭
                _socket.Close();
                _socket = null;
            }

            //IPEndPoint ipe = new IPEndPoint(IPAddress.Parse(host), port);
            //创建套接字
            try
            {
                _socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                _socket.Connect(host, port);
                _socket.Blocking = false;
            }
            catch
            {
                _socket.Close();
                _socket = null;
                return false;
            }
            if (_socket.Connected)
            {
                AsynRecive();
            }
                
            return _socket.Connected;

        }

        protected void connectComplete(IAsyncResult ar)
        {
            try
            {
                _socket.EndConnect(ar);
                update(SAACollection.COMPLETE);
                SAUtils.Log("Success ... ");
                AsynRecive();
            } catch (SocketException e)
            {
                update(SAACollection.ERROR);
                SAUtils.Log("ErrorCode ... " + e.ErrorCode);
            }
        }

        //接收数据
        protected void AsynRecive()
        {
            try
            {
                //开始接收数据
                //该步骤只读取长度
                clear_receive_buffers(CommandCollection.SOCK_CONTEXT_LENGTH);
                _socket.BeginReceive(receive_buffers, 0, receive_buffers.Length, SocketFlags.None, readMessageLength =>
                {
                    _socket.EndReceive(readMessageLength);
                    msg_length = readUShort();
                    clear_receive_buffers(msg_length);
                    _socket.BeginReceive(receive_buffers, 0, receive_buffers.Length, SocketFlags.None, receiveMessage =>
                    {
                        _socket.EndReceive(receiveMessage);
                        ///---------读取数据
                        SASocketDataDAO sdd = new SASocketDataDAO(readUShort(), readBytes(msg_length - CommandCollection.SOCK_TYPE_LENGTH));
                        //CommandCollection.getDataModel((ProtoTypeEnum)sdd.type, sdd.bytes);
                        SAUtils.Log("收到消息号 : " + (ProtoTypeEnum)sdd.type);
                        dispatchEvent(Command + (ProtoTypeEnum)sdd.type, sdd);
                        AsynRecive();
                    }, null);
                }, null);
            }
            catch (Exception ex)
            {
                SAUtils.LogError("异常信息：" + ex.Message);
                AsynRecive();
            }
        }

        public void sendMessage(ProtoTypeEnum type, byte[] cust)
        {
            int length = 0;
            if (null != cust)
            {
                length = cust.Length;
            }
            //总长度+类型长度+包体长度
            clean_buffers(CommandCollection.SOCK_HEAD_LENGTH + length);//);//初始化缓冲区(需要加上包长度值)
            writeUShort(Convert.ToUInt16(length + CommandCollection.SOCK_TYPE_LENGTH));//长度
            writeUShort(Convert.ToUInt16(type));
            if (0 != length)
                writeBytes(cust);//消息内容
            flush();//推出消息
        }

        /**
         * lua调用
         */
        /*public void sendMessageByString(int type, LuaStringBuffer str)
        {
            sendMessage((ProtoTypeEnum)type, str.buffer);
        }*/
        public void sendMessageByGeneratedMessage(int type, object obj)
        {
            byte[] cust = CommandCollection.getDataModelToByteArray((ProtoTypeEnum)type, obj);
            sendMessage((ProtoTypeEnum)type, cust);
        }

        //protected void update2Type(ushort type)
        //{
        //    dispatchEvent(Command + type, data);
        //}
        //protected void update2Type(ushort type, System.Object data)
        //{
        //    this.data = data;
        //    dispatchEvent(Command + type, data);
        //}

        protected void clean_buffers(int length)
        {
            socket_buffers = new byte[length];
            position = 0;
        }
        protected void writeInt(int value)
        {
            byte[] temp = BitConverter.GetBytes(value);
            Buffer.BlockCopy(temp, 0, socket_buffers, position, temp.Length);
            position += temp.Length;
        }
        protected void writeBytes(byte[] value)
        {
            Buffer.BlockCopy(value, 0, socket_buffers, position, value.Length);
            position += value.Length;
        }
        protected void writeByte(byte value)
        {
            socket_buffers[position] = value;
            ++position;
        }
        protected void writeUShort(ushort value)
        {
            byte[] temp = BitConverter.GetBytes(value);
            Buffer.BlockCopy(temp, 0, socket_buffers, position, temp.Length);
            position += temp.Length;
        }
        protected void flush()
        {
            SocketError err;
            _socket.Send(socket_buffers, 0, socket_buffers.Length, SocketFlags.None, out err);
            if (err != SocketError.Success)
            {
                data = err;
                update(SAACollection.ERROR);
            }
            socket_buffers = null;
        }

        //read
        protected void clear_receive_buffers(int length)
        {
            receive_buffers = new byte[length];
            receive_position = 0;
        }
        protected int readInt()
        {
            int temp = BitConverter.ToInt32(receive_buffers, receive_position);
            receive_position += sizeof(Int32);
            return temp;
        }
        protected ushort readUShort()
        {
            ushort temp = BitConverter.ToUInt16(receive_buffers, receive_position);
            receive_position += sizeof(UInt16);
            return temp;
        }

        protected byte readByte()
        {
            byte temp = receive_buffers[receive_position];
            receive_position += sizeof(byte);
            return temp;
        }
        protected byte[] readBytes(int length)
        {
            byte[] temp = new byte[length];
            Buffer.BlockCopy(receive_buffers, receive_position, temp, 0, length);
            receive_position += length;
            return temp;
        }

        ///废数据 
        protected byte[] getWasteStr(int length)
        {
            if (sampleBa == null)
            {
                setSampleBa();
            }

            int start = random.Next(0, 64 - length);
            byte[] ba = new byte[length];
            Buffer.BlockCopy(sampleBa, start, ba, 0, ba.Length);
            return ba;
        }
        protected void setSampleBa()
        {
            sampleBa = new byte[64];
            for (int i = 0; i < 64; ++i)
            {
                sampleBa[i] = (byte)random.Next(0, 16);
            }
        }

    }
}