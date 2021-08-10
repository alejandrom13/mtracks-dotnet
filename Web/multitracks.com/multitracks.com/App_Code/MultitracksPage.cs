using System;
using System.Web.UI;

public class MultitracksPage : Page
{
	public string notFoundImgURL = "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png";
	public string notFoundHeroURL = "https://i0.wp.com/elfutbolito.mx/wp-content/uploads/2019/04/image-not-found.png?ssl=1";

	public MultitracksPage()
	{
		Load += MultitracksPage_Load;
	}

	void MultitracksPage_Load(object sender, EventArgs e)
	{

	}
}
