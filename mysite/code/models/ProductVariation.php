<?php

class ProductVariation extends DataObject {
	
	private static $db = array(
		'Title' => 'Varchar(255)',
		'DefaultPrice' => 'Currency',
        'SKUExtension' => 'Varchar(16)',
        'WidthIn' => 'Int',
        'HeightIn' => 'Int'
	);

	private static $belongs_many_many = array(
        'Products' => 'Product'
    );

    private static $summary_fields = array(
        'Title',
        'DefaultPrice',
        'SKUExtension'
    );

    private static $default_sort = "DefaultPrice ASC";

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

    public function getPxWidth() {
        return $this->WidthIn * 25;
    }

    public function getPxHeight() {
        return $this->HeightIn * 25;
    }
    

}