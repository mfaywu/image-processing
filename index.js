

    var getPixels=require("get-pixels")

    getPixels("IMG_4318.png", function (err, pixels) {
	    if(err) {
		console.log("Bad image path")
		return
	    }
	    console.log("got pixels",pixels.shape.slice())

	    console.log(pixels[1])
	})

