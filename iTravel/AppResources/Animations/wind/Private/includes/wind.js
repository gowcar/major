const NUMBER_OF_CLOUDS = 8; // clouds to show on screen
const NUMBER_OF_IMAGES = 9; // images + 1
function init() { 
    var container = document.getElementById("windContainer");
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
    image.src = "wind/Private/images/cloud" + randomInteger(1, NUMBER_OF_IMAGES) + ".png";
    cloudDiv.style.top = pixelValue(randomInteger(0, 480));
    cloudDiv.style.left = pixelValue(randomInteger(-80, -0));
    var spinAnimationName = (Math.random() < 0.5) ? "clockwiseSpin" : "counterclockwiseSpinAndFlip";
    cloudDiv.style.webkitAnimationName = "fade, float";
    image.style.webkitAnimationName = spinAnimationName;
    var fadeAndfloatDuration = durationValue(randomFloat(4, 8));
    var spinDuration = durationValue(randomFloat(6, 20));
    cloudDiv.style.webkitAnimationDuration = fadeAndfloatDuration + ", " + fadeAndfloatDuration;
    image.style.webkitAnimationDuration = spinDuration;
    cloudDiv.appendChild(image);
    return cloudDiv;
}
window.addEventListener("load", init, false);
