document.getElementsByTagName('body').classList.add("blockScrolling");

window.onload = function() {
  document.getElementById("loading").classList.toggle("fadeOut");
  document.getElementsByTagName('body').classList.remove("blockScrolling");
}