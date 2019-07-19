using System.Collections.Generic;
namespace org.jiira.protobuf {
	public class ConvertModel{
		private int x, y, len;
		private string iostring;
		private static ConvertModel instance;
		public static ConvertModel getInstance() {
			if (null == instance) {
				instance = new ConvertModel();
			}
			return instance;
		}
		public void setting(string iostring) {
			setting(iostring, 0, 0);
		}
		public void setting(string iostring, int x, int y) {
			len = iostring.Length;
			this.iostring = iostring;
			this.x = x;
			this.y = y;
		}
		private string read() {
			int offset = SAProtoDecode.decodeAssign.Length;
			x = iostring.IndexOf(SAProtoDecode.decodeAssign, x) + offset;
			y = iostring.IndexOf(SAProtoDecode.decodeSplit, x);
			if (y == -1) {
				y = iostring.IndexOf(SAProtoDecode.decodeEnd, x);//结尾保护
				offset = SAProtoDecode.decodeEnd.Length;
			}
			string value = iostring.Substring(x, y - x);
			x = y + offset;
			return value;
		}
		public int readInt() {
			return int.Parse(read());
		}
		public bool readBoolean() {
			return read().Equals(SAProtoDecode.isBooleanStr);
		}
		public float readFloat()
		{
			return float.Parse(read());
		}
		public string readString()
		{
			return read();
		}
		public string[] readArray()
		{
			x = iostring.IndexOf(SAProtoDecode.decodeArrayAssign, x) + 1;
			y = iostring.IndexOf(SAProtoDecode.decodeArrayEnd, x);
			string value = iostring.Substring(x, y - x);
			x = y + SAProtoDecode.decodeArrayEnd.Length;
			return System.Text.RegularExpressions.Regex.Split(value,SAProtoDecode.splitStr);
		}
		public bool limit()
		{
			return x >= len;
		}
		public void flip()
		{
			x = 0;
			y = 0;
		}
	}
	public class SAProtoDecode
	{
		public const string SAString = "string";
		public const string SAInt = "int";
		public const string SAFloat = "float";
		public const string SABoolean = "boolean";
		public const string SAArray = "array";
		public const string isBooleanStr = "1";
		public const string splitStr = "\\[\\*]";
		public const string decodeAssign = "[:]";
		public const string decodeSplit = "[,]";
		public const string decodeEnd = "[}]";
		public const string decodeArrayAssign = "[:][{]";
		public const string decodeArrayEnd = "[}][,]";
		public const string decodeStrEnd = "\"";
		public const string classNameEnd = "[}][]]\"";
		public SAProtoDecode() {}
		/**
		 * 解析一套数据表
		 * @param iostring
		 */
		public static void parsing(string iostring)
		{
			int x = 0, y = 0, len = iostring.Length;
			string typeName;
			string endName;
			string fragmentStr;
			while (x < len) {
				x = iostring.IndexOf(decodeStrEnd, x) + 1;//查询类型名称首部
				if (x == -1)
					break;//解析完毕
				y = iostring.IndexOf(decodeStrEnd, x);//查询类型名称尾部
				typeName = iostring.Substring(x, y - x);//获得类型
				endName = classNameEnd + typeName + decodeStrEnd;//获得类型结尾(如果解析内容中包含了自身类型，无法解析)
				x = y + decodeAssign.Length + 1;//查询内容首部(跳过冒号)
				y = iostring.IndexOf(endName, x);//查询内容尾部
				fragmentStr = iostring.Substring(x, y - x);//获得内容
				x = y + endName.Length;
				setIOString(typeName, fragmentStr);
			}
		}
		public static void setIOString(string type, string iostring) {
			switch (type) {
				case STCardType: {
					STCard.parsing(iostring);
					break;
				}
			}
		}
		public const string STCardType = "sTCard";
	}
	public class STCard {
		public STCard() { }
		private static List<STCard> list;
		private static Dictionary<int, STCard> map;
		public static List<STCard> getList() {
			if (null == list) {
				list = new List<STCard>();
			}
			return list;
		}
		public static Dictionary<int, STCard> getMap() {
			if (null == map) {
				map = new Dictionary<int, STCard>();
			}
			return map;
		}
		public static void parsing(string iostring) {
			List<STCard> list = getList();
			Dictionary<int, STCard> map = getMap();
			list.Clear();
			map.Clear();
			ConvertModel buf = ConvertModel.getInstance();
			buf.setting(iostring);
			STCard sTCard;
			while(!buf.limit()) {
				sTCard= new STCard();
				sTCard.id = buf.readInt();
				sTCard.name = buf.readString();
				sTCard.rare = buf.readInt();
				sTCard.up = buf.readInt();
				sTCard.left = buf.readInt();
				list.Add(sTCard);
				map.Add(sTCard.Id, sTCard);
			}
		}
		private int id;
		public int Id {get{return id;}}
		private string name;
		public string Name {get{return name;}}
		private int rare;
		public int Rare {get{return rare;}}
		private int up;
		public int Up {get{return up;}}
		private int left;
		public int Left {get{return left;}}
	}
}