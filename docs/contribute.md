---
hide:
  - navigation
---

# Contribute

You can add scenarios and activities, improve wording and rules, or improve
the layout and design. The project lives on
[GitHub](https://github.com/Karneades/Defensomania).

## Adding or changing cards

The cards are tab-separated files in the
[cards folder](https://github.com/Karneades/Defensomania/tree/master/cards):
`activities.tsv`, `scenarios.tsv` and `worst.tsv`. Please follow these rules:

* Keep the `Activity` text to **170 characters or fewer**, including spaces.
  Longer text does not fit and is cut off with an ellipsis (`…`).
* Text with many capital letters or long words fits fewer characters (about
  150). If the build prints `Ellipsized (too much text)`, shorten the text.
* Write activities as imperative phrases, for example "Block IPs".
* Keep the columns tab-separated.
* Add the original author or link in the `Source` column for content taken
  from somewhere else.

## Reviewing a pull request

Every pull request that changes the cards, the layout or the build setup is
built automatically by GitHub Actions. The workflow checks the file format and
the text length and attaches the generated deck to the run as the artifact
`defensomania-deck` (PDFs and a zip with all PNGs).

To see how the cards and PDFs look before merging:

1. Open the **Checks** tab of the pull request.
1. Select the **Build card deck** run.
1. Download the artifact from the **Artifacts** section.

Artifacts expire after a retention period and need a GitHub login to download.

## Ideas

* **Event cards:** inject new events into an otherwise static scenario, such as
  "credentials were stolen from server X", "credentials abused on system X" or
  "data exfiltration identified on server X". The team reacts to each event
  with activity cards.
* **Extra packs**, for example a "Worst Response Pack" with bad activities for
  a scenario about a compromised workstation. See the [worst cards](cards.md#worst-response-pack)
  for examples.
* **PowerShell Against Humanity:** a pack with only incident response
  activities that use PowerShell commands. Not funny enough? Now you're scared!
