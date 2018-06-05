$(document).ready(function() {
	getFavorites();
	getFavoritesNearbies();

	$('#edit').on('click',function(){
		$('.editMenu').css('left','0%');
	});
	
	
	$('#submit').on('click',function(){
		var checkin = $('#checkin').val();
		var checkout = $('#checkout').val();
		var children = $('#children').val();
		var adults = $('#adults').val();
		var category = $('#categories').val();
		var line = "<strong>CheckIn:</strong> "+checkin+" <strong>CheckOut:</strong> "
		+checkout+"  <strong>Numero Bambini:</strong> "+children+" <strong>Numero Adulti:</strong> "
		+adults+" <strong>Categoria:</strong> "+category;
		$('#calendar').append(line);
		
	});
	
	$('#pdf').on('click', function () {
		generatePDF();
	});
	
});

/****************************************************** FUNCTIONS ******************************************************/

function generatePDF() {
    var pdf = new jsPDF('p', 'pt','letter');
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#favoritesContainer')[0];

    // we support special element handlers. Register them with jQuery-style 
    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
    // There is no support for any other type of selectors 
    // (class, of compound) at this time.
   
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 10,
        bottom: 30,
        left: 10,
        width: 630
    };
    // all coords and widths are in jsPDF instance's declared units
    // 'inches' in this case
    pdf.fromHTML(
    source, // HTML string or DOM elem ref.
    margins.left, // x coord
    margins.top, { // y coord
        'width': margins.width, // max width of content on PDF
        'elementHandlers': specialElementHandlers
    },

    function (dispose) {
        // dispose: object with X, Y of the last line add to the PDF 
        //          this allow the insertion of new lines after html
    	pdf.save('PianoVacanza.pdf');
    }, margins);
}

function getFavorites(){

	$.ajax({
		type : "GET",
		url : "writeFavorites",
		success : function(data) {	
			$('#favorites').html(data);
			
			$(".delete").on('click', function(e) {
				e.stopPropagation();
				$(this).closest('li').remove();
			});
		},
		error : function(data) {	
			alert("error in write favorites");
		}
		
	});
}

function getFavoritesNearbies(){

	$.ajax({
		type : "GET",
		url : "getNearbiesPlan",
		success : function(data) {	
			$('#nearbies').html(data);
			
			$(".delete").on('click', function(e) {
				e.stopPropagation();
				$(this).closest('li').remove();
			});
		},
		error : function(data) {	
			alert("error in getNearbiesPlan");
		}
		
	});
}





