/**
* 导出obj文件
*/
using UnityEngine;
using UnityEditor;
using System.Collections; 
using System.Collections.Generic; 
using System.Text;
using System.Runtime.InteropServices;
using System;
using System.IO;

[CustomEditor(typeof(MeshFilter))]
[CanEditMultipleObjects]
public class SAMeshExportEditor : Editor {
	private int vertexOffset = 0;
	private int normalOffset = 0;
	private int uvOffset = 0;
	public override void OnInspectorGUI(){
        base.OnInspectorGUI();
		//DrawDefaultInspector();
		//MeshFilter tbg = (MeshFilter) target;
		if (GUILayout.Button("Export")){
			Debug.Log("Save Command");
			OpenFileName ofn = new OpenFileName();
			ofn.structSize = Marshal.SizeOf(ofn);
			ofn.filter = "folder name";
			ofn.file = new string(new char[256]);
			ofn.maxFile = ofn.file.Length;
			ofn.fileTitle = new string(new char[64]);
			ofn.maxFileTitle = ofn.fileTitle.Length;
			ofn.initialDir = UnityEngine.Application.dataPath;//默认路径
			ofn.title = "Save Project";
			//OFN_FILEMUSTEXIST|OFN_EXPLORER|OFN_PATHMUSTEXIST| OFN_ALLOWMULTISELECT|OFN_NOCHANGEDIR
			ofn.flags = 0x00000008;// | 0x00080000 | 0x00001000 | 0x00000800 | 0x00000200;//

            //if (DllTest.GetSaveFileName(ofn))
            //{
            //    Debug.Log(ofn.file);
            //}
            string newPrefabPath = EditorUtility.SaveFilePanel("Folder", "", "", "");
            if (newPrefabPath != null)
            {
                SelectMeshList(newPrefabPath + "/");
            }
		}
	}
	private void SelectMeshList(string folder){
		foreach (GameObject o in Selection.GetFiltered(typeof(GameObject), SelectionMode.DeepAssets))
		{
			MeshToFile(o.GetComponent<MeshFilter>(), folder, o.name);
		}
	}
	private void MeshToFile(MeshFilter mf, string folder, string filename) {
		Dictionary<string, ObjMaterial> materialList = PrepareFileWrite();
		Vector3 scale = mf.gameObject.transform.localScale;
		mf.gameObject.transform.localScale = scale * 100;
		Vector3 pos = mf.gameObject.transform.position;
		mf.gameObject.transform.position = pos * 100;// + mf.gameObject.transform.localScale - scale;

		if (!Directory.Exists(folder)){
			Directory.CreateDirectory(folder);
		}
		using (StreamWriter sw = new StreamWriter(folder + filename + ".obj")) {
			sw.Write("mtllib ./" + filename + ".mtl\n");
			sw.Write(MeshToString(mf, materialList));
		}
		MaterialsToFile(materialList, folder, filename);

		mf.gameObject.transform.position = pos;
		mf.gameObject.transform.localScale = scale;
	}
	private string MeshToString(MeshFilter mf, Dictionary<string, ObjMaterial> materialList) {
		Mesh m = mf.sharedMesh;//mesh;//sharedMesh;
		Material[] mats = mf.GetComponent<Renderer>().sharedMaterials;
		StringBuilder sb = new StringBuilder();
		sb.Append("g ").Append(mf.name).Append("\n");
		foreach(Vector3 lv in m.vertices) {
			Vector3 wv = mf.transform.TransformPoint(lv);
			//This is sort of ugly - inverting x-component since we're in
			//a different coordinate system than "everyone" is "used to".
			sb.Append(string.Format("v {0} {1} {2}\n",-wv.x,wv.y,wv.z));
		}
		sb.Append("\n");
		foreach(Vector3 lv in m.normals) {
			Vector3 wv = mf.transform.TransformDirection(lv);
			sb.Append(string.Format("vn {0} {1} {2}\n",-wv.x,wv.y,wv.z));
		}
		sb.Append("\n");
		foreach(Vector3 v in m.uv) {
			sb.Append(string.Format("vt {0} {1}\n",v.x,v.y));
		}
		for (int material=0; material < m.subMeshCount; material ++) {
			sb.Append("\n");
			sb.Append("usemtl ").Append(mats[material].name).Append("\n");
			sb.Append("usemap ").Append(mats[material].name).Append("\n");
			//See if this material is already in the materiallist.
			try{
				ObjMaterial objMaterial = new ObjMaterial();
				objMaterial.name = mats[material].name;
				if (mats[material].mainTexture)
                    objMaterial.textureName = mats[material].mainTexture.name;//EditorUtility.GetAssetPath(mats[material].mainTexture);
				else 
					objMaterial.textureName = null;
				materialList.Add(objMaterial.name, objMaterial);
			}catch (ArgumentException){
				//Already in the dictionary
			}
            
			int[] triangles = m.GetTriangles(material);
			for (int i=0;i<triangles.Length;i+=3) {
				//Because we inverted the x-component, we also needed to alter the triangle winding.
				sb.Append(string.Format("f {1}/{1}/{1} {0}/{0}/{0} {2}/{2}/{2}\n", triangles[i]+1 + vertexOffset, triangles[i+1]+1 + normalOffset, triangles[i+2]+1 + uvOffset));
			}
		}

		vertexOffset += m.vertices.Length;
		normalOffset += m.normals.Length;
		uvOffset += m.uv.Length;
		return sb.ToString();
	}
	private void MaterialsToFile(Dictionary<string, ObjMaterial> materialList, string folder, string filename){
		using (StreamWriter sw = new StreamWriter(folder + filename + ".mtl")) {
			foreach( KeyValuePair<string, ObjMaterial> kvp in materialList ){
				sw.Write("\n");
				sw.Write("newmtl {0}\n", kvp.Key);
				sw.Write("Ka  0.6 0.6 0.6\n");
				sw.Write("Kd  0.6 0.6 0.6\n");
				sw.Write("Ks  0.9 0.9 0.9\n");
				sw.Write("d  1.0\n");
				sw.Write("Ns  0.0\n");
				sw.Write("illum 2\n");
				if (kvp.Value.textureName != null){
					string destinationFile = kvp.Value.textureName;
					int stripIndex = destinationFile.LastIndexOf('/');//FIXME: Should be Path.PathSeparator;
					if (stripIndex >= 0)
						destinationFile = destinationFile.Substring(stripIndex + 1).Trim();
					string relativeFile = destinationFile;
					destinationFile = folder + destinationFile;
					Debug.Log("Copying texture from " + kvp.Value.textureName + " to " + destinationFile);
					try{
						//Copy the source file
						File.Copy(kvp.Value.textureName, destinationFile);
					}catch{
					}
					sw.Write("map_Kd {0}", relativeFile);
				}
				sw.Write("\n\n\n");
			}
		}
	}
	private Dictionary<string, ObjMaterial> PrepareFileWrite(){
		Clear();
		return new Dictionary<string, ObjMaterial>();
	}
	private void Clear(){
		vertexOffset = 0;
		normalOffset = 0;
		uvOffset = 0;
	}
}
struct ObjMaterial
{
	public string name;
	public string textureName;
}

[StructLayout(LayoutKind.Sequential, CharSet=CharSet.Auto)]
class OpenFileName{
	public OpenFileName(){
	}
	public int structSize = 0;
	public IntPtr dlgOwner = IntPtr.Zero; 
	public IntPtr instance = IntPtr.Zero;
	public String filter = null;
	public String customFilter = null;
	public int maxCustFilter = 0;
	public int filterIndex = 0;
	public String file = null;
	public int maxFile = 0;
	public String fileTitle = null;
	public int maxFileTitle = 0;
	public String initialDir = null;
	public String title = null; 
	public int flags = 0; 
	public short fileOffset = 0;
	public short fileExtension = 0;
	public String defExt = null; 
	public IntPtr custData = IntPtr.Zero; 
	public IntPtr hook = IntPtr.Zero; 
	public String templateName = null; 
	public IntPtr reservedPtr = IntPtr.Zero; 
	public int reservedInt = 0;
	public int flagsEx = 0;
}

class DllTest
{
	[DllImport("Comdlg32.dll",SetLastError=true,ThrowOnUnmappableChar=true, CharSet = CharSet.Auto)]
	public static extern bool GetOpenFileName([In, Out] OpenFileName ofn); 
	public static bool GetOpenFileName1([In, Out] OpenFileName ofn){
		return GetOpenFileName(ofn);
	}
	[DllImport("Comdlg32.dll", SetLastError = true, ThrowOnUnmappableChar = true, CharSet = CharSet.Auto)]
	public static extern bool GetSaveFileName([In, Out] OpenFileName ofn);
	public static bool GetSaveFileName1([In, Out] OpenFileName ofn){
		return GetSaveFileName(ofn);
	}
	
}