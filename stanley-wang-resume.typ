#set page(paper: "us-letter", margin: (x: 0.75cm, y: 0.4cm))
#set text(size: 10pt, font: "Charter")
#set line(length: 100%, stroke: 0.25mm)
#set par(leading: 0.37em, justify: true)
#show heading.where(level: 2): it => {
  it; v(-0.8em); line(); v(0.2em)
}
#let header(name, ..params) = align(center)[
  #text(size: 1.7em, weight: "semibold")[
    #name.split().join(h(0.3em))
  ] \ #v(-0.1em)
  #params.pos().join(" | ") #v(-1em)
]
#let skip = h(1fr) // For the horizontal spacing between title and date

#show link: it => underline(text(fill: blue)[#it])

#header(
  // Make links regular if printed
  "Stanley Wang",
  "stanley.wang.cs@gmail.com",
  "U.S. & Canada",
  link("https://github.com/stanley-910")[GitHub],
  link("https://www.linkedin.com/in/notstanleywang/")[LinkedIn],
  link("https://stanleywang.dev")[Portfolio]
)

== Skills
*Languages*: Python, TypeScript, Java, Go, C++, C, JavaScript, MySQL, OCaml, Lua, Bash \
*Technologies*: Git, Unix/Linux, React, Flask, REST APIs, WebSocket, Redis, PyTorch, AWS, Docker, CI/CD, NGINX

== Education
*McGill University, Bachelor of Science, Computer Science* #skip Sep 2022 -- Dec 2026

== Experience
*Software Engineering Intern*, *Electronic Arts*, EADP Commerce, Redwood City, CA #skip May 2026 -- Aug 2026
- Prototyped an *agentic commerce* surface that stages and verifies personalized purchases on the Madden Mobile Web Store
- Implemented *cross-boundary identity handoff* across identity and commerce microservices
- Engineered agent runtime with *FastAPI* and *OpenAI Agents SDK*: SSE streaming, dynamic tooling, *SQLite* purchase-plan store
- Projected *\$157K* (*+4.65%*) annual revenue lift, enabled in-part by designing and shipping upstream *multi-item cart* support
- Created and deployed an *agent orchestration* system on an internal server, which integrated with team's tooling and platforms

*Software Engineering Intern*, *Autodesk*, Montreal, QC #skip May 2025 -- Aug 2025
- Contributed to *Flow Production Tracking* and *Creative Review's* public beta, enhancing *UI/UX* and *performance* for major studios (*Disney*, *Sony*, *MAPPA*)
- Introduced a *visual debugging tool* with *user event sequence tracing*; improved deployment reliability via *TDD* and *CI/CD*

*Software Engineering Intern*, *BETA Technologies*, Montreal, QC — #link("https://stanleywang.dev/experience/beta-case-study")[Case Study] #skip Jan 2025 -- Apr 2025
- Developed structural analysis library in *Python*, reducing *3-day* manual process to *10 seconds*
- Engineered a batch-processor to efficiently modify *multi-gigabyte* finite element aircraft models
- Accelerated future development of structural analysis tools by *95%*

*Lead Researcher*, *McGill AI Ethics Lab*, Montreal, QC #skip May 2024 -- Dec 2024
- Designed a *cross-language API* library in *Go* with *C bindings* for *Python* integration, improving team velocity by *40%*

== Projects
*Eastwatch*, Agent Orchestration #skip #link("https://github.com/stanley-910/eastwatch")[GitHub]
- Built an issue-board-driven *agent orchestrator* turning GitLab/GitHub/Jira/Obsidian board gestures into detached, resumable *tmux* workers running *Claude* and *Pi* sub-agents
- Designed *reconciliation-loop* architecture (*launchd*) with fleet TUI, crash-detected resumable runs, and multi-provider *model routing*; scaled to a hosted multi-user *Docker* variant (*SQLite* outbox dispatch, isolated per-user containers) for an EA team

*Mini-C Compiler*, Compilers #skip // no link — course forbids sharing code
- Built an *end-to-end compiler* for a *C subset* in *Java* — hand-written *lexer* and *Pratt Parser* down to *MIPS32* assembly
- Implemented *semantic analysis* — *name analysis* over scoped *symbol tables* and *type checking* — over a generated *AST*
- Implemented *graph-coloring register allocation* over a *control-flow graph*, with *backward liveness analysis* and *spill* code
- Extended the language with *classes*, single *inheritance*, and *virtual dispatch*; verified with a *JUnit* fixture suite on *MARS*

*OS Kernel Simulator*, Systems Programming #skip
- Built an *OS simulator* in *C*: a shell loads script *programs* into simulated memory and runs them as concurrent processes
- Implemented preemptive *round robin* scheduling with *aging*, raising process priority so long jobs never starve
- Simulated *demand paging* with per-process *page tables*, evicting the *LRU* frame on *page faults*

*Pi Talk*, Open-Source Agentic Tooling #skip #link("https://github.com/stanley-910/pi-talk")[GitHub]
- Released an *open-source* voice layer for *Claude Code* and *Pi*, a beloved *agentic harness*, via *streaming OpenAI TTS*
- Shipped the port in a day *orchestrating AI agents* over spec-locked tickets: 88 unit tests, zero live *API* calls

*Trading Fours*, Full Stack & Machine Learning #skip #link("https://www.youtube.com/watch?v=sx5btkY24hQ")[Demo Video] | #link("https://github.com/stanley-910/trading-fours")[GitHub]
- Built a music recommendation engine that predicts genre with *XGBoost*; deployed on *AWS EC2* with *Docker* and *CI/CD*
