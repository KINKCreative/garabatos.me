<?

class Product extends DataObject {

    public $URLPrefix = 'products';

	private static $db = array(
		'Title' => 'Varchar(255)',
        'SKU' => 'Varchar(16)',
		'Description' => 'Text',
		'QuickPrice' => 'Currency'
	);

	private static $has_one = array(
		'Image' => 'Image',
        'Collection' => 'Collection'
	);

	static $many_many = array(
        'ProductVariations' => 'ProductVariation',
    );

    static $many_many_extraFields = array(
        'ProductVariations' => array(
            'PriceOverride' => 'Currency',
            'SKU' => 'Varchar(16)'
        )
    );

    static $defaults = array(
        'Price' => 5
    );

    function getCMSFields() {
        $fields = parent::getCMSFields();
        if($this->ID) {
            $variations = ProductVariation::get();
            $config = $fields->dataFieldByName('ProductVariations')->getConfig();
            $config->addComponent(new GridFieldEditableManyManyExtraColumns(), 'GridFieldEditButton');
            $config->addComponent(new GridFieldManyRelationHandler(), 'GridFieldPaginator');
            // $config->RemoveComponentByType('EditButton');
            $config->removeComponentsByType('GridFieldEditButton');
            $config->removeComponentsByType('GridFieldDeleteAction');
            $config->removeComponentsByType('GridFieldDetailForm');
            $config->removeComponentsByType('GridFieldAddNewButton');
            //$fields->addFieldToTab('Root.Main', new CheckboxSetField("MyProductVariations", "Product variations", $variations->toArray()),$this->ProductVariations()->toArray());

            // $config = GridFieldConfig_RelationEditor::create();
            // // $config->addComponent(new GridFieldFilterHeader());

            // $gridField = new GridField("Variations", "Product variations", $this->ProductVariations(), $config);
            // // $dataColumns = $gridField->getConfig()->getComponentByType('GridFieldDataColumns');
            // // $dataColumns->setDisplayFields(array(
            // //     'Title' => 'Title',
            // //     'SKU',
            // //     'PriceOverride'
            // // ));
            // $gridField->getConfig()->addComponent(new GridFieldEditableManyManyExtraColumns(), 'GridFieldEditButton');
            // $fields->addFieldToTab('Root.Main', $gridField);
        }
        return $fields;
    }


}