<?php

class ProductVariation extends DataObject {
	
	private static $db = array(
		'Title' => 'Varchar(255)',
		'DefaultPrice' => 'Currency'
	);

	private static $belongs_many_many = array(
        'Products' => 'Product'
    );

    private static $summary_fields = array(
        'Title',
        'DefaultPrice'
    );

    function getCMSFields() {
        $fields = parent::getCMSFields();
        if($this->ID) {
            $fields->dataFieldByName('Products')->getConfig()->addComponent(new GridFieldEditableManyManyExtraColumns(), 'GridFieldEditButton');
        }
        return $fields;
    }

    public function getPrice() {
        return $this->DefaultPrice;
    }

}