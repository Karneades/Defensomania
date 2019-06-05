# Defensomania Card Set

Defensomania uses two types of cards:
[activities](activities.tsv) and [scenarios](scenarios.tsv). The source files
are tab-delimited and include a phase, activity and source column. The
scenario cards describe fictional security incidents and the activity cards
describe activities used to handle these incidents. See column `Source` in the
source files for external content attribution.

The activity cards are categorized based on the following well-known incident
response phases: 

* Prepare
* Detect
* Respond
* Recover
* Lessons Learned
* Communications

![Showcase](../img/showcase.png)

See the list of [activities](activities.tsv) and
[scenarios](scenarios.tsv) in a nicely rendered list on Github.

![Cards-Preview](../img/cards-preview.png)

More activity cards means more possibilities during the game to react. Consider
adding more activities and scenarios.

Additionally, see [worst card set](worst.tsv) for some examples regarding
building an extra pack for "Worst Response Pack". An activity for a scenario
about a compromised workstation could be "log into the machine as domain
administrator to search for malware" or "forward maldoc file to ticketing
system where different others have access too", "communicate on twitter that
you was hacked before social media department is informed". Not funny enough?
Then what about building a PowerShell pack with only incident response
activities using PowerShell commands called _PowerShell Against Humanity_? Now
you're scared!

## Build

Build your own Defensomania card deck using [Squib](https://github.com/andymeneely/squib) and the [instructions](../BUILD.md).
