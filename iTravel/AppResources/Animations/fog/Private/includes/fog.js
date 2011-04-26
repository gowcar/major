const NUMBER_OF_CLOUDS = 25; // clouds to show on screen
const NUMBER_OF_IMAGES = 13; // images + 1
function init() { 
    var container = document.getElementById("fogContainer");
    for (var i = 0; i < NUMBER_OF_CLOUDS; i++) {
	container.appendChild(createACloud())}
}
function randomInteger(low, high) {
    return low + Math.floor(Math.random() * (high - low));
}
function randomFloat(low, high) {
    return low + Math.random() * (high - low);
}
function pixelValue(value) {
    return value + "px";
}
function durationValue(value) {
    return value + "s";
}
function createACloud() {
    var cloudDiv = document.createElement("div");
    var image = document.createElement("img");
    image.src = "fog/Private/images/fog" + randomInteger(4, NUMBER_OF_IMAGES) + ".png";
    cloudDiv.style.top = pixelValue(randomInteger(-200, 350));
    cloudDiv.style.left = pixelValue(randomInteger(-110, -110));
    var spinAnimationName = (Math.random() < 0.5) ? "clockwiseSpin" : "counterclockwiseSpinAndFlip";
    cloudDiv.style.webkitAnimationName = "float";
    image.style.webkitAnimationName = spinAnimationName;
    var fadeAndfloatDuration = durationValue(randomFloat(40, 70));
    var spinDuration = durationValue(randomFloat(30, 80));
    cloudDiv.style.webkitAnimationDuration = fadeAndfloatDuration + ", " + fadeAndfloatDuration;
    image.style.webkitAnimationDuration = spinDuration;
    cloudDiv.appendChild(image);
    return cloudDiv;
}
window.addEventListener("load", init, false);
