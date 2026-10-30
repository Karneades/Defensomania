const HAND_SIZE = 10;
const { scenarios, activities } = window.CARDS;

const scenarioEl = document.getElementById("scenario");
const handEl = document.getElementById("hand");

let scenarioDeck = [];

function shuffle(items) {
  const a = [...items];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

const slug = (phase) => phase.toLowerCase().replace(/\s+/g, "-");
const isJoker = (card) => /^joker\b/i.test(card.text);

function el(tag, className, text) {
  const node = document.createElement(tag);
  if (className) node.className = className;
  if (text) node.textContent = text;
  return node;
}

function showScenario() {
  if (scenarioDeck.length === 0) scenarioDeck = shuffle(scenarios);
  const card = scenarioDeck.pop();
  scenarioEl.replaceChildren(el("div", "label", "Scenario"), el("div", "", card.text));
  if (card.source) scenarioEl.append(el("div", "source", `Source: ${card.source}`));
}

function dealHand() {
  handEl.classList.remove("has-selection");
  handEl.replaceChildren(
    ...shuffle(activities).slice(0, HAND_SIZE).map((card) => {
      const btn = el("button", `card activity ${slug(card.phase)}${isJoker(card) ? " joker" : ""}`);
      btn.type = "button";
      btn.append(el("div", "phase", card.phase), el("div", "text", card.text));
      btn.addEventListener("click", () => {
        const wasSelected = btn.classList.contains("selected");
        clearSelection();
        if (!wasSelected) {
          btn.classList.add("selected");
          handEl.classList.add("has-selection");
        }
      });
      return btn;
    })
  );
}

function clearSelection() {
  handEl.classList.remove("has-selection");
  handEl.querySelectorAll(".selected").forEach((n) => n.classList.remove("selected"));
}

document.getElementById("new-scenario").addEventListener("click", () => {
  showScenario();
  dealHand();
});
document.getElementById("redeal").addEventListener("click", dealHand);
document.getElementById("clear").addEventListener("click", clearSelection);

showScenario();
dealHand();
