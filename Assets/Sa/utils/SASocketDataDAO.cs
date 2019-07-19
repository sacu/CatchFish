using System.Text;
using Sacu.Utils;
namespace Datas
{

    public class SASocketDataDAO
    {
        public ushort type;
        public byte[] bytes;
        //public LuaStringBuffer context;
        public SASocketDataDAO(ushort type, byte[] bytes)
        {
            this.type = type;
            this.bytes = bytes;
            //context = new LuaStringBuffer(bytes);
        }
    }
}
