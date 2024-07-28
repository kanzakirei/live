document.documentElement.style.overflow = "hidden";

window.onload = function () {
  document.getElementById("loading").classList.toggle("loadingFadeOut");
  document.documentElement.style.overflow = "visible";
}