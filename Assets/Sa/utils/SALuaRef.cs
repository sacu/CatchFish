namespace Sacu.Utils
{
    using System;
    public class SALuaRef
    {
        public IntPtr L;
        public int reference;

        public SALuaRef(IntPtr L, int reference)
        {
            this.L = L;
            this.reference = reference;
        }
    }
}