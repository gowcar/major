var now = new Date();

var h = now.getHours();

var m = now.getMinutes();

var s = now.getSeconds();



      function image() {  

		
	 var image = document.getElementById('changeimage');

			if (h == 18) {

		image.src = 'moon/moon6pm.png';

	 } else if (h == 19) {

	    image.src = 'moon/moon7pm.png';

	 } else if (h == 20) {

	    image.src = 'moon/moon8pm.png';

	 } else if (h == 21) {

	    image.src = 'moon/moon9pm.png';

	 } else if (h == 22) {

	    image.src = 'moon/moon10pm.png';

	 } else if (h == 23) {

	    image.src = 'moon/moon11pm.png';

	 } else if (h == 00) {

	    image.src = 'moon/moon_midnight.png';

	 } else if (h == 1) {

	    image.src = 'moon/moon1am.png';

	 } else if (h == 2) {

	    image.src = 'moon/moon2am.png';

	 } else if (h == 3) {

	    image.src = 'moon/moon3am.png';

	 } else if (h == 4) {

	    image.src = 'moon/moon4am.png';

	 } else if (h == 5) {

	    image.src = 'moon/moon5am.png';

	 } else if (h == 6) {

	    image.src = 'moon/moon6am.png';

	 } 

	

      } 