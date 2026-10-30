// Optional enhancement: without JS the cards page is plain static HTML.
(function () {
  var legend = document.querySelector(".card-legend");
  var cards = document.querySelectorAll(".game-card");
  if (!legend || !cards.length) return;

  var input = document.createElement("input");
  input.type = "search";
  input.className = "card-filter";
  input.placeholder = "Filter cards...";
  input.setAttribute("aria-label", "Filter cards");

  var status = document.createElement("p");
  status.className = "card-filter-status";
  status.setAttribute("aria-live", "polite");

  legend.parentNode.insertBefore(input, legend.nextSibling);
  legend.parentNode.insertBefore(status, input.nextSibling);

  var grids = document.querySelectorAll(".card-grid");

  function apply() {
    var query = input.value.trim().toLowerCase();
    var shown = 0;

    cards.forEach(function (card) {
      var match = !query || card.textContent.toLowerCase().indexOf(query) !== -1;
      card.hidden = !match;
      if (match) shown++;
    });

    grids.forEach(function (grid) {
      var visible = grid.querySelector(".game-card:not([hidden])") !== null;
      grid.hidden = !visible;
      // Hide the phase heading of an empty grid as well.
      var heading = grid.previousElementSibling;
      if (heading && heading.tagName === "H3") heading.hidden = !visible;
    });

    status.textContent = query
      ? shown + " of " + cards.length + " cards match"
      : "";
  }

  input.addEventListener("input", apply);
})();
