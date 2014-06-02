<?php

class Collection extends DataObject {
	
	public $URLPrefix = 'collection';

	private static $db = array(
		'Title' => 'Varchar(255)',
		'URLSegment' => 'Varchar(255)'
	);

	private static $has_many = array(
		'Products' => 'Product'
	);

	function onBeforeWrite() {
		if((!$this->URLSegment || $this->URLSegment=='new-collection') && $this->Title !='New collection') {
			$this->URLSegment = SiteTree::generateURLSegment($this->Title);
		}
		else if ($this->isChanged('URLSegment')) {
			$segment = preg_replace('/[^A-Za-z0-9]+/','-',$this->URLSegment);
			$segment = preg_replace('/-+/','-',$segment);
			
			if(!$segment) {
				$segment="collection-$this->ID";
			}
			$this->URLSegment = $segment;	
		}
		
		$count=2;
		while($this->LookForExistingURLSegment($this->URLSegment)) {
			$this->URLSegment = preg_replace('/-[0-9]+$/', null, $this->URLSegment).'-'.$count;
			$count++;
		}
		
		parent::onBeforeWrite();
	}
	
	function LookForExistingURLSegment($URLSegment) {
		return(DataObject::get_one('Collection', "URLSegment = '".$URLSegment."' AND Collection.ID != ".$this->ID));
	}

	public function Link() {
		return 'collections/view/' . $this->URLSegment;       
	}
	
	public function AbsoluteLink() {
		return "http://garabatos.me/".$this->Link();
	}

	public function MenuTitle() {
		return $this->Title;
	}


}