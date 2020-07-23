/* 	Initialisation de la classe basket 
	qui contient les fonctions 
	relatives au panier d'achat*/
class Basket {

	constructor() {
    	this.items = this.loadBasket();
   		console.log(this.items);
   		this.displayItemsBasket();
  	}

/*	Affichage de l'id="displayBasket" 
	(en haut prêt de l'icône panier).*/
  	displayItemsBasket() {
  		
	/* On affiche le nombre d'articles dans le panier
	   (lorsqu'il y en a). */	
  		if(this.items.length > 0) {
  			$('#itemBasket').removeClass('hide');
   			$('#itemBasket').text(this.items.length);
   		} 
	// Si le panier est vide on n'affiche rien.
   		else {
   			$('#itemBasket').addClass('hide');
   			$('#itemBasket').text('');
   		}
  	}

//	Fonction d'ajout d'un article au panier
	addToBasket(teeId, name, quantity, size, price) {
		console.log("taille", size)
		teeId    = parseInt(teeId);
    	quantity  = parseInt(quantity);

		let item = {
			teeId: teeId,
			name: name,
			quantity: quantity,
			size: size,
			price: price
		}

/* 	Si on ajoute le même modèle au panier,
	et que le taille du tee shirt est la même :
	ajouter la quantité sur la même ligne. 

(Implicitement, si le modèle est le même, mais que la 
taille est différente: on crée une nouvelle ligne). */
		for(let index = 0; index < this.items.length; index++) {
		    if(this.items[index].teeId == teeId & this.items[index].size == size) {
		      	this.items[index].quantity += quantity
		            this.saveBasket();
		            return true;
		    }
		}
		this.items.push(item);
		this.saveBasket();
	}

	loadBasket() {
		let items = loadDataFromDomStorage('imagoShop');
		
		if (items == null) {
			items = [];
		}
		return items;
	}

	saveBasket() {
		saveDataToDomStorage('imagoShop', this.items);	
		this.displayItemsBasket();

		if(window.location.href.indexOf('/basket') != -1) {
			this.displayCompleteBasket();
		}
	}

	displayCompleteBasket() {
		console.log(document.body.offsetWidth);
		let totalPrice= 0;
		if(this.items.length > 0) {

			$('#displayBasket table tbody').empty();

			if (document.body.offsetWidth > 760 ) {

				for (let i = 0; i < this.items.length; i++) {
					totalPrice += parseFloat(this.items[i].quantity)*parseFloat(this.items[i].price);
					var tr = $('<tr>');
					tr.append('<td>'+this.items[i].quantity+'</td><td>'+this.items[i].name+'</td><td>'+this.items[i].size+'</td><td>'+this.items[i].price.toFixed(2)+' €</td><td>'+(parseFloat(this.items[i].quantity)*parseFloat(this.items[i].price)).toFixed(2) +' €</td><td><button class="trash-tee" data-index="'+i+'"><i class="fas fa-trash-alt"></i></button></td>')
					$('#displayBasket table tbody').append(tr);
				}
			} else {
				for (let i = 0; i < this.items.length; i++) {
					totalPrice += parseFloat(this.items[i].quantity)*parseFloat(this.items[i].price);
					var tr = $('<tr>');
					tr.append('<td>'+this.items[i].quantity+'</td><td>'+this.items[i].name+'</td><td>'+this.items[i].size+'</td><td>'+(parseFloat(this.items[i].quantity)*parseFloat(this.items[i].price)).toFixed(2) +' €</td><td><button class="trash-tee" data-index="'+i+'"><i class="fas fa-trash-alt"></i></button></td>')
					$('#displayBasket table tbody').append(tr);
				}
			}
			
			$('#totalPrice').text(totalPrice.toFixed(2));
			
			this.loadBasketInInput('#basketItem');
		} else {
			$('#displayBasket').html('<p>Votre panier est vide...</p>');
			$('.p-form').css('display', 'none');
		}	
	}


	loadBasketInInput(elmt) {
		$(elmt).val(JSON.stringify(this.items));
	}

	removeToBasket(id) {
		console.log("remove");
		this.items.splice(id, 1);
		this.saveBasket();
	}

	clearBasket() {
		this.items = [];
		this.saveBasket();
	}

}