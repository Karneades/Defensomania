---
hide:
  - navigation
---

# Gameplay

Choose a mode based on what your team wants to practice. Both modes use the
same cards: one player reads a [scenario](cards.md#scenarios), the others
respond with [activities](cards.md#activities).

<div class="grid cards" markdown>

-   **Best card wins**

    ---

    Compare and discuss single activities and how well they fit a scenario.
    Competitive, with a defend point for the best answer.

    [Read the rules](#best-card-wins)

-   **Incident response process**

    ---

    Walk through one scenario from start to end, phase by phase. Cooperative
    and more in-depth: a team exercise.

    [Read the rules](#incident-response-process)

</div>

## Best card wins

!!! abstract "Goal"
    Think about and discuss single activities, and decide which one fits the
    scenario best.

### Setup

1. Put the scenario cards face down in the middle of the table.
1. Each player draws **ten activity cards** and keeps them hidden. Skip the
   _joker_ cards.
1. Pick one player to be the first attacker.

### Each round

1. **Read.** The attacker takes the top scenario card and reads it out loud.
1. **Propose.** Each defender passes the best activity card, face down, to the
   attacker.

    !!! tip "Variant"
        Instead of passing a card, each defender explains the proposed
        activity out loud. You can also include the joker cards.

1. **Pick.** The attacker shuffles the cards, reads all activities out loud and
   picks the best one. Whoever submitted it wins the scenario card as a
   **defend point**.
1. **Discuss.** Talk through the decision technically and how you would
   implement it in your environment. Use the questions below.
1. **Refill.** Everyone draws back up to ten cards.
1. **Rotate.** The next player becomes the attacker and a new round begins.

### Questions to discuss

| Phase of the picked card | Question |
|---|---|
| **Prepare** | What should have been in place to be ready for this scenario? |
| **Detect** | How could you identify the attack, or the malicious activity happening right now? |
| **Respond**, **Recover**, **Communication**, **Lessons Learned** | How would you respond to the incident? |

## Incident response process

!!! abstract "Goal"
    See how your team would handle a fictional incident from beginning to end.
    This is a more in-depth way of dealing with a single scenario.

Discuss processes, responsibilities, tools, priorities and who to contact in an
emergency.

!!! question "Questions to ask"
    * "If we have this incident, what preparation do we need to handle it?"
    * "If we must contain the compromised host, how would we do that?"
    * "If we add a new subsidiary to our monitoring and incident response
      scope, how would we handle this scenario for its infrastructure?"

### The phases in order

<div class="phase-flow">
<span class="card-chip phase-prepare">Prepare</span>
<span class="card-chip phase-detect">Detect</span>
<span class="card-chip phase-respond">Respond</span>
<span class="card-chip phase-recover">Recover</span>
<span class="card-chip phase-lessons-learned">Lessons Learned</span>
<span class="card-chip phase-communication">Communication</span>
</div>

### Setup

1. Put the scenario cards face down in the middle of the table.
1. Group the activity cards face up by phase.

### Play

1. **Read.** One player takes the first scenario card and reads it out loud.
   Good luck.
1. **Start with Prepare.** Spread out the activity cards of the first phase
   around the table.
1. **Play cards.** In turn, each player takes one card from the current phase
   that fits the scenario and describes the steps and tools used to carry it
   out. Discuss the activity and its priority for the scenario as a group.
1. **Move on.** When all relevant cards of a phase are played, move on to the
   next phase.
