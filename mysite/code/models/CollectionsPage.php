<?php
class CollectionsPage extends Page {

	function Children() {
		$c = Collection::get();
		return $c;
	}

}
class CollectionsPage_Controller extends Page_Controller {

	private static $allowed_actions = array (
		"view"
	);

	public function init() {
		parent::init();
	}

	function view()
	{	
		if($Item = $this->getCurrentItem()) {
			$Data = array(
				'Title' => $Item->Title,
				'Content' => $Item->Content,
				'MetaTitle' => $Item->Title,
				'Products' => $Item->Products(),
				'ProductCount' => $Item->Products()->Count(),
				'Item' => $Item,
				'AbsoluteLink' =>$Item->AbsoluteLink()
			);
			return $this->customise($Data)->renderWith(array('Collection','Page'));	
		}
	    else {
			return $this->httpError(404, _t("Blog.NOTFOUND","Blog entry not found."));
		}
	}
	
	public function getCurrentItem()
	    {
	        $Params = $this->getURLParams();
	        $URLSegment = Convert::raw2sql($Params['ID']);  
			if($URLSegment && $Item = DataObject::get_one('Collection',
	        	"URLSegment = '" . $URLSegment . "'"))
			{       
			return $Item;
		}
	}
	
}


class Product_Controller extends Page_Controller {

	private static $allowed_actions = array (
		"index",
		"view"
	);

	public function init() {
		parent::init();
	}

	function index()
	{	
		if($Item = $this->getCurrentItem()) {
			$Data = array(
				'Title' => $Item->Title,
				'Content' => $Item->Content,
				'MetaTitle' => $Item->Title,
				'Collection' => $Item->Collection(),
				'ClassName' => "Product",
				'Item' => $Item,
				'AbsoluteLink' =>$Item->AbsoluteLink()
			);
			return $this->customise($Data)->renderWith(array('Product','Page'));	
		}
	    else {
			return $this->httpError(404, _t("Product.NOTFOUND","Product not found."));
		}
	}
	
	public function getCurrentItem() {
    $Params = $this->getURLParams();
    $URLSegment = Convert::raw2sql($Params['URLSegment']);  
		if(	$URLSegment && 
				$Item = DataObject::get_one('Product', "URLSegment = '" . $URLSegment . "'") ) {       
			return $Item;
		}
	}
	
}

class BlankImage_Controller extends Page_Controller {

	public function init() {
		parent::init();
	}

	function index()
	{	
		header("Content-type: image/png");
		$Params = $this->getURLParams();
		$width = Convert::raw2sql($Params['width']);
		$height = Convert::raw2sql($Params['height']);
		$image = imagecreatetruecolor($width, $height);
		imagealphablending($image, false);
		imagesavealpha($image, true);

		$transparent = imagecolorallocatealpha( $image, 0, 0, 0, 127 ); 
		imagefill( $image, 0, 0, $transparent ); 

		imagepng($image);
		imagedestroy($image);
		return false;
	}
	
}