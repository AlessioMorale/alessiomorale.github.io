// Menu toggle for small screens. Without JavaScript the links stay visible.
(function () {
  var nav = document.querySelector("#navigation .site-nav");
  var toggle = nav && nav.querySelector(".nav-toggle");
  if (!toggle) return;

  var setOpen = function (open) {
    nav.classList.toggle("is-open", open);
    toggle.setAttribute("aria-expanded", String(open));
  };

  toggle.addEventListener("click", function () {
    setOpen(toggle.getAttribute("aria-expanded") !== "true");
  });

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape" && nav.classList.contains("is-open")) {
      setOpen(false);
      toggle.focus();
    }
  });

  nav.addEventListener("click", function (event) {
    if (event.target.closest(".nav-list a")) setOpen(false);
  });
})();
