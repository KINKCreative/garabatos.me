simpleCart({
    checkout: {
      type: "PayPal",
      email: "info@kinkcreative.com"
    },
    cartStyle: "table",
    shippingCustom: function(){ 
      sh = 12;
      if(simpleCart.total() > 100) {
        sh = 0;
      }
      else {
        sh = Math.round( simpleCart.total()*0.1 );
        if(sh < 12) {
          sh = 12;
        }
      }
      return sh;
    },
    cartColumns: [
        { attr: "name", label: "Name"},
        { view: "currency", attr: "price", label: "Price"},
        { view: "decrement", text: '<i class="fa fa-minus-square-o"></i>', label: false},
        { attr: "quantity", label: "Qty"},
        { view: "increment", text: '<i class="fa fa-plus-square-o"></i>', label: false},
        { view: "currency", attr: "total", label: "SubTotal" },
        { view: "remove", text: '<i class="fa fa-remove"></i>', label: false }
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

$("a.accordion-link").click(function(e) {
  url = $(this).attr("href");
  location.href = url;
});

// $(".sidebar .expandable").click(function(e) {  
// 	// e.preventDefault();
// 	$(".expandable .fa").removeClass("fa-angle-up").addClass("fa-angle-down");
// 	$(this).find(".fa").toggleClass("fa-angle-down").toggleClass("fa-angle-up");
// 	return false;
// });

$(document).ready(function() {

  $('.single-item').slick({
    prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-chevron-left"></button>',
    nextArrow: '<button type="button" class="slick-next"><i class="fa fa-chevron-right"></button>',
    dots: true,
    // centerMode: true,
    // adaptiveHeight: true
  });
  $('.variable-width').slick({
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true
  });

  // $(window).scroll(Foundation.utils.throttle(function(e){
  //   scroll = $(window).scrollTop();
  //   $(".off-canvas-wrap:not(.move-right) .left-off-canvas-menu").css("top",scroll);
  // }, 100));
	//$("a.fancybox").fancybox();

	/* $('#fancybox-wrap').bind('contextmenu', function() {
    	return false;
	}); */
});
