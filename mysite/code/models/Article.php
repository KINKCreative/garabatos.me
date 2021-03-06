<?php

class Article extends DataObject {
	
	private static $db = array(
			'Title' => 'Varchar(255)',
			'Content' => 'HTMLText',
			'URLSegment' => 'Varchar(255)',
			'VideoEmbed' => 'Text',
			'Published' => 'Boolean',
			'Featured' => 'Boolean'
		);
		
		private static $has_one = array(
			'Blogroll' => 'Blogroll'
		);
		
		private static $has_many = array(
			'Images' => 'ArticleImage'
		);
		
		private static $casting = array(
			"LastEdited" => "SS_Datetime",
			"Created" => "SS_Datetime"
		);
		
		private static $summary_fields = array(
			'Title',
			'Blogroll.Title',
			'Created',
			'Published' => 'IsPublished',
			'Featured'
		);
		
		private static $searchable_fields = array(
			'Title',
			'BlogrollID',
			'Published'
		); 	
		
//		static $indexes = array (
//			'URLSegment' => true
//		);
		
		private static $default_sort = 'Created DESC';
		
		private static $singular_name = "Article";
		private static $plural_name = "Articles";
		
		private static $defaults = array(
			'Title'=>'New article',
			'Published' => 1
		);
		
		public function getCMSFields()
		{
			
			//$imageField = new ImageUploadField("Image","Upload image");
			//$imageField->setUploadFolder("articles/images");
			
			$photoManager = new ImageDataObjectManager(
				$this, // Controller
				'Images', // Source name
				'ArticleImage', // Source class
				'Image', // File name on DataObject
				array(
					'Caption' => 'Name'
				), // Headings 
				'getCMSFields_forPopup' // Detail fields (function name or FieldSet object)
				// Filter clause
				// Sort clause
				// Join clause
			);
			$photoManager->setUploadFolder("images/posts");
			
			if(!$this->ID) {
				$photoManager = new ReadonlyField("Photos","Photos","Save article to add photos.");
			}
			
			$pf = new DatetimeField("PublishDate",$this->fieldLabel('PublishDate'));
			$pf->getDateField()->setConfig('showcalendar', true);
			$pf->getTimeField()->setConfig('showdropdown', true); 
			$date = date('d/m/Y h:i:s a');
			
			$tabPublish = new Tab(_t('BlogItem.TABPUBLISH', 'Publish'),
				$pf,
				new TextField("URLSegment", $this->fieldLabel('URLSegment')),
				new DatetimeField_Readonly("LastEdited",$this->fieldLabel('LastEdited')),
				new CheckboxField("Published",$this->fieldLabel('Published'))
//					new CheckboxField("ShowComments",$this->fieldLabel('ShowComments'))
			);
			
			$previewField = $this->ID ? new LiteralField("Link","<div id='Link' class='field readonly'><div class='middleColumn'><span class='readonly right'><a href='".$this->Link()."' target='_blank'>Preview article</a></span></div></div>") : new LiteralField("Link","<div id='Link' class='field readonly'><div class='middleColumn'><span class='readonly right'>Save to preview.</span></div></div>");
			
			
			$blogrollField = new ReadonlyField("Blogrolls","Blogroll","You need to add at least one Blogroll to select.");
			$blogroll = DataObject::get("Blogroll","","ParentID ASC");
			if($blogroll) {
				$blogrollField = new DropdownField("BlogrollID","Blogroll",$blogroll->toDropdownMap("ID","DropdownTitle","Select one"));
			}
			
			$extraFields = new TabSet ("Root",
				$contentTab = new Tab(_t("BlogItem.TABCONTENT", "Content"),
					$blogrollField,
					$authorField,
					new TextField("Title", $this->fieldLabel('Title')),
					new HtmlEditorField("Content", "Content",10),
//					$imageField,
					new TextareaField("VideoEmbed", "Enter Custom Embed Code",5),
					new CheckboxField('Featured', "Featured"),
					$previewField
				),
				$photoTab = new Tab(_t('Photos',"Photos"),
					new HeaderField("H2","Photos",3),
					$photoManager
				),
				$tabPublish
			);
			
			$f = new FieldSet(
				$extraFields
			);
				
			return $f;
		}
		
		
		function canDelete($member = NULL) { 
			return Permission::check('CMS_ACCESS_CMSMain'); 
		}
		
		function canCreate($member = NULL) { 
			return Permission::check('CMS_ACCESS_CMSMain'); 
		}
		function canEdit($member = NULL) { 
			return Permission::check('CMS_ACCESS_CMSMain'); 
		}
		
		function onBeforeWrite() {
			if((!$this->URLSegment || $this->URLSegment=='new-article') && $this->Title !='New article') {
				$this->URLSegment = SiteTree::generateURLSegment($this->Title);
			}
			else if ($this->isChanged('URLSegment')) {
				$segment = preg_replace('/[^A-Za-z0-9]+/','-',$this->URLSegment);
				$segment = preg_replace('/-+/','-',$segment);
				
				if(!$segment) {
					$segment="article-$this->ID";
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
			return(DataObject::get_one('Article', "URLSegment = '".$URLSegment."' AND Article.ID != ".$this->ID));
		}
		
		public function Link() {
			return $this->Blogroll()->absoluteLink() . 'article/' . $this->URLSegment;       
		}
		
		public function AbsoluteLink() {
			return $this->Link();
		}
		
		public function Permalink() {
			return $this->Link();
		}
		
		public function IsPublished() {
			return $this->Published ? "Yes" : "No";
		}
		
		public function FirstImage() {
			if($this->Images()->First()) {
				return $this->Images()->First()->Image();
			}
		}
		public function Parent() {
			return $this->Blogroll();
		}
		
		function ThumbnailURL() {
			if($this->VideoEmbed) {
				return "http://img.youtube.com/vi/".singleton("Page_Controller")->YouTubeID($this->VideoEmbed)."/0.jpg";
			}
			if($this->Images()) {
				if($i = $this->Images()->First()) {
					//return $i->Image()->resizeByWidth(200)->URL;
				}
			}
			return "http://www.mundotrevi.com/assets/images/MundoTrevi.jpg";
		}
		
		
}



?>