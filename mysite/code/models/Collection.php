<?php

class Collection extends DataObject {
	
	public $URLPrefix = 'collection';

	private static $db = array(
		'Title' => 'Varchar(255)'
	);

	private static $has_many = array(
		'Products' => 'Product'
	);

}