import csv
import html
from pathlib import Path

from mkdocs.structure.files import File

ROOT = Path(__file__).resolve().parent.parent
MARKER = "<!-- cards -->"


def on_files(files, config):
    """Serve the images from the repository's img folder without copying them."""
    for image in sorted((ROOT / "img").glob("*.png")):
        files.append(
            File(
                f"img/{image.name}",
                str(ROOT),
                config["site_dir"],
                config["use_directory_urls"],
            )
        )
    return files


def on_page_markdown(markdown, page, config, files):
    if MARKER not in markdown:
        return markdown
    return markdown.replace(MARKER, _render_cards())


def _read(name):
    path = ROOT / "cards" / f"{name}.tsv"
    with path.open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f, delimiter="\t", quoting=csv.QUOTE_NONE))


def _slug(text):
    return text.strip().lower().replace(" ", "-")


def _is_joker(row):
    return row["Activity"].strip().startswith("Joker")


def _split(rows):
    cards = [r for r in rows if not _is_joker(r)]
    return cards, len(rows) - len(cards)


def _source(row):
    source = (row.get("Source") or "").strip()
    if source.startswith("http"):
        url = html.escape(source, quote=True)
        return f'<a class="game-card__source" href="{url}">source</a>'
    if source:
        return f'<span class="game-card__source">{html.escape(source)}</span>'
    return ""


def _card(row, label):
    text = html.escape(row["Activity"].strip(), quote=False)
    return (
        '<div class="game-card">'
        f'<span class="game-card__phase">{html.escape(label)}</span>'
        f"<p>{text}</p>{_source(row)}</div>"
    )


def _joker(count):
    noun = "joker card" if count == 1 else "joker cards"
    return (
        '<div class="game-card game-card--joker">'
        f"<p>{count} {noun}: invent your own</p></div>"
    )


def _grid(kind, cards, jokers=0, label=None):
    """One block of cards. Must not contain blank lines to stay raw HTML."""
    items = [_card(r, label or r["Phase"]) for r in cards]
    if jokers:
        items.append(_joker(jokers))
    return f'<div class="card-grid phase-{kind}">\n' + "\n".join(items) + "\n</div>\n"


def _chip(kind, anchor, label, count):
    return (
        f'<a class="card-chip phase-{kind}" href="#{anchor}">'
        f"{html.escape(label)}<span>{count}</span></a>"
    )


def _render_cards():
    scenarios, scenario_jokers = _split(_read("scenarios"))
    activities = _read("activities")
    worst = _read("worst")
    phases = list(dict.fromkeys(r["Phase"] for r in activities))

    chips = [_chip("scenario", "scenarios", "Scenarios", len(scenarios))]
    for phase in phases:
        count = len([r for r in activities if r["Phase"] == phase and not _is_joker(r)])
        chips.append(_chip(_slug(phase), _slug(phase), phase, count))
    chips.append(_chip("worst", "worst-response-pack", "Worst Response Pack", len(worst)))

    out = ['<div class="card-legend">' + "".join(chips) + "</div>\n"]

    out.append("## Scenarios\n")
    out.append("Scenario cards describe a fictional incident. The attacker reads one out loud.\n")
    out.append(_grid("scenario", scenarios, scenario_jokers, "Scenario"))

    out.append("## Activities\n")
    out.append("Activity cards are the steps defenders can take, grouped by incident response phase.\n")
    for phase in phases:
        cards, jokers = _split([r for r in activities if r["Phase"] == phase])
        out.append(f"### {phase}\n")
        out.append(_grid(_slug(phase), cards, jokers))

    out.append("## Worst Response Pack\n")
    out.append("Extra cards with bad activities, for a laugh.\n")
    out.append(_grid("worst", worst))

    return "\n".join(out)
