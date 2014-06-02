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