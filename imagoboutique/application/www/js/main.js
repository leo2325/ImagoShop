'use strict';

// FONCTION //


// 	Apparition/disparition de la sous-liste:
let basket = new Basket();
let state = false;

/* 	Apparition de la sous-liste au 
	passage de la souris sur l'icône user */
$('#userButton').on('mouseover', function() {
	$('.under-nav-list').removeClass('hide');
});

/* 	Disparition de la sous-liste après
	passage de la souris sur l'icône user */
$('.under-nav-list').on('mouseout', function() {
	$('.under-nav-list').addClass('hide');
});


//	Ajout de produit au panier au clique souris:
if(window.location.href.indexOf('/products') != -1) {

	$('.addToBasket').on('click', function(event) {
		event.preventDefault();
		let id = $(this).data('id');
		let name = $(this).data('name');
		let quantity = $('#tee-'+id).val();
		let size = $('#size').val();
		let price = $(this).data('price');

/*	Obligation de sélectionner la quantité désirée.
	Si la quantité n'a pas été sélectionné:
	apparition de "errorPopUpQuantity". */
		if(isNaN(quantity) || quantity == '') {
			$('#errorPopUpQuantity').removeClass('hide');
			$('#tee-'+id).val('');
		}
/* 	Obligation de sélectionner la taille désirée.
	Si la taille n'a pas été sélectionné:
	apparition de "errorPopUpSize". */ 
		else if(size == ''){
			$('#errorPopUpSize').removeClass('hide');
			$('#size').val();
		}
/* 	Si la quantité et la taille ont été sélectionné :
	Ajouter le(s) produit(s) au panier. */
		else {
			console.log(id);
			console.log(name);
			console.log(quantity);
			console.log(size);
			basket.addToBasket(id, name, quantity, size, price);
/* 	Apparition de la "productPopUp" confirmant 
	l'ajout de la sélection au panier */
			$('#productPopUp').removeClass('hide');
			$('#teeNumber').text(quantity);
			$('#tee-'+id).val('');
		}
	});

//  Fermeture des popUp au clique sur la croix.   
	$('.closePopUp').on('click', function(event) {
		$('#productPopUp').addClass('hide');
		$('#errorPopUpQuantity').addClass('hide');
		$('#errorPopUpSize').addClass('hide');
	});
}


// Afficher la sélection de produit dans le panier.
if(window.location.href.indexOf('/basket') != -1) {
	console.log('panier');
	basket.displayCompleteBasket();

// Supprimer la sélection au clique sur l'icône poubelle.
	$(document).on('click', '.trash-tee', function(event) {
		event.preventDefault();
		let id = $(this).data('index');
		basket.removeToBasket(id);
	});
}

//  Lier le panier au paiement.  
if(window.location.href.indexOf('/payment') != -1) {
		basket.loadBasketInInput('#orders');
}

//  Succès du paiement et remise à zéro du panier. 
if(window.location.href.indexOf('/success') != -1) {
		console.log('success');
		basket.clearBasket();
}


//   CODE PRINCIPAL   //








