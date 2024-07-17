document.getElementByTagName("body").classList.add("blockScrolling");

window.onload = function() {
  document.getElementById("loading").classList.toggle("fadeOut");
  document.getElementByTagName("body").classList.remove("blockScrolling");
}