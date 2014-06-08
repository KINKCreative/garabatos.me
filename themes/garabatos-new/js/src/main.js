
$(document).foundation();

simpleCart({
    checkout: {
      type: "PayPal",
      email: "info@kinkcreative.com"
    },
    cartStyle: "table",
    shippingCustom: function(){ 
    	return 5 + simpleCart.quantity()*2;
    },
    cartColumns: [
        { attr: "name", label: "Name"},
        { view: "currency", attr: "price", label: "Price"},
        { view: "decrement", text: '<i class="icon-minus-circled"></i>', label: false},
        { attr: "quantity", label: "Qty"},
        { view: "increment", text: '<i class="icon-plus-circled"></i>', label: false},
        { view: "currency", attr: "total", label: "SubTotal" },
        { view: "remove", text: '<i class="icon-cancel-circled"></i>', label: false }
    ],
});

var dd = false;
$(".dropdownClick").click(function(e) {
	//e.preventDefault();
	dd = true;
});

$(".addClick").click(function() {
	if(!dd) {
		addItem($(this));
	}
	else {
		dd=false;
	}
});
$(".addItem").click(function() {
	addItem($(this));
});

function addItem(element) {
	title = element.data("title") + " (" + element.data("variation") + ")";
	sku = element.data("sku");
	price = element.data("price");
	quantity = element.closest(".cartItem-wrapper").find(".itemQuantity").val();
	simpleCart.add({ 
	    name: title,
	    price: price,
	    sku: sku ,
	    quantity: quantity
	});
}

$(".checkbox").change(function() {
	if($(this).prop("checked")==true) {
		simpleCart.data[taxRate] = 0.08;
		$(".simpleCart_tax").fadeIn();
	}
	else {
		simpleCart.data[taxRate] = 0;
		$(".simpleCart_tax").fadeOut();	
	}
});

$(".collections_dropdown").click(function(e) {
	e.preventDefault();
	$(this).next().slideToggle(500);
	$(this).find(".icon").toggleClass("icon-angle-down").toggleClass("icon-angle-up");
	return false;
});

$(document).ready(function() {
	$("a.fancybox").fancybox();

	$('#fancybox-wrap').bind('contextmenu', function() {
    	return false;
	});
});
