// start by making everything an IIFE
(function () {
	// A();

	function C() {

		console.log("Oops");

	}

	function E(f) {
		console.log("E");
		f();
		var f = F;
	}

	function A() {
		console.log("A");
		B();
	}

	var C;

	function G() {
		console.log("G");
		H();

		function H() {
			console.log("H");
			I();
		}
	}

	var D = d

	function d() {
		console.log("D");
		E(F);
	};

	function I() {
		console.log("I");
		J();
		J();
	}

	B = function() {
		console.log("B");
		C();
	}

	var F = function() {
		console.log("F");
		G();
	}

// must create the object to stay in a local lexical scope
	var rest = "KLMNOPQRSTUVWXYZ".split(""), obj = {};
	for (var i=0; i<rest.length; i++) {
		(function(i){
			// define the current function
			obj[rest[i]] = function() {
				console.log(rest[i]);
				if (i < (rest.length-1)) {
					// TODO: call the next function
					obj[rest[i+1]]();

				}
			};
		})(i);
	}

	var J = (function() {
		J = (function() {
			console.log("J");
			obj.K();
		});
	});

	function C() {
		console.log("C");
		D();
	}

	 return A;

})()();
