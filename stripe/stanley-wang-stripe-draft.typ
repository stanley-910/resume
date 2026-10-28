// WORKING DRAFT — inherited claims and final selection are not yet verified.
#set page(paper: "us-letter", margin: (x: 0.81cm, y: 0.3cm))
#set text(size: 10pt, font: "Charter")
#set line(length: 100%, stroke: 0.25mm)
#set par(leading: 0.28em, justify: true)
// sticky block keeps heading + rule together; a trailing v() here breaks page fitting
#show heading.where(level: 2): it => block(sticky: true, above: 1.0em, below: 0.6em)[#it #v(-0.8em) #line()]
#let header(name, ..params) = align(center)[
  #text(size: 1.7em, weight: "semibold")[
    #name.split().join(h(0.3em))
  ] \ #v(-0.1em)
  #set par(justify: false)
  #text(font: "Berkeley Mono Prose", size: 8.5pt)[#params.pos().join(h(1.2em))] #v(-0.6em)
]
#set list(indent: 0.4em)
#let hlink(url, body) = link(url, box(body))
#let skip = h(1fr) // For the horizontal spacing between title and date
// Experience entry: company + date on the scan line, role + location under it
#let entry(company, date, role, loc, stack, team: none) = [
  *#company*#if team != none [ | #team] #skip #date \
  #emph(role) -- #stack #skip #loc
]

// Inline SVG icons from icons/ (GitHub mark + Primer Octicons, MIT). Fill is
// baked into each SVG. The show rule skips the underline for icon-only links.
#let icon(name) = box(baseline: 0.15em, height: 0.95em, image("icons/" + name + ".svg"))
#show link: it => if it.body.func() == box { it } else { underline(text(fill: blue)[#it]) }

#header(
  "Stanley Wang",
  [#icon("fa-location")#h(0.35em)San Francisco, CA],
  [#icon("fa-phone")#h(0.35em);(425) 635-8108],
  [#icon("fa-envelope")#h(0.35em)#hlink("mailto:hi@stanleywang.cc")[hi\@stanleywang.cc]],
  [#icon("link-16")#h(0.35em)#hlink("https://stanleywang.dev")[stanleywang.dev]],
  [#icon("fa-linkedin")#h(0.35em)#hlink("https://www.linkedin.com/in/notstanleywang/")[notstanleywang]],
  [#icon("fa-github")#h(0.35em)#hlink("https://github.com/stanley-910")[stanley-910]],
)

== Education
*McGill University*, B.Sc. in Computer Science #skip Sep 2022 -- Dec 2026

== Experience
#entry([Electronic Arts], [May 2026 -- Aug 2026], [Software Engineering Intern], [_Redwood City, CA_], [Python, Java, TypeScript, SQLite], team: [Commerce & Identity])
- *Agentic Commerce*: Prototyped a shopping assistant that personalizes and stages Madden Mobile purchases
- Recorded purchases only after a service-authenticated callback matched the staged cart; made checkout retries idempotent
- Wrote an agent runtime with FastAPI and OpenAI Agents SDK: SSE streaming, session-gated tools, SQLite purchase-plan store
- Preserved conversation continuity across login, enabling shoppers to sign in mid-chat and continue with personalized help
- Expanded Madden Mobile commerce integration to expose player rosters, currencies, and progression data
- Shipped multi-item cart support to production in the shared commerce service behind the Madden Mobile Web Store
- Analyzed historical commerce data and comparable studies to project \$157K in annual revenue lift from the assistant
- *Automation Tooling*: Deployed a shared-server agent fleet with per-user Docker workspaces and onboarded engineers
- Integrated GitLab and Jira context with agent-driven implementation, merge-request creation, and regression-test triggering, increasing team velocity without hurting reviewability, verifiability, and ownership of the code 

#entry([Autodesk], [May 2025 -- Aug 2025], [Software Engineering Intern], [_Montreal, QC_], [TypeScript, React, IndexedDB, Jenkins], team: [Media & Entertainment])
- Built an observability pipeline for live frame-by-frame review sessions in Creative Review's public beta
- Logged six event streams to IndexedDB: playback, pen strokes, text annotations, cursor position, rendering, session join/leave
- Built a visual debugger over the pipeline, aligning host and participant logs to pinpoint where clients diverged
- Resolved a production outage for two large studios within an afternoon by correcting feature-gating logic in the login flow  

#entry([BETA Technologies], [Jan 2025 -- Apr 2025], [Software Engineering Intern], [_Montreal, QC_], [Python, PySide6, GitLab CI], team: [Stress & Structures])
- Automated NASTRAN aircraft model preprocessing in Python, reducing a three-day manual workflow to under 10 seconds
- Developed a reusable Python library for NASTRAN model transformations: DMIG prep, numerical buckling, coordinate symmetry
- Implemented checkpoint-based rollback to generate model variants from shared state without re-parsing or copying

#entry([McGill AI Ethics Lab], [May 2024 -- Dec 2024], [Lead Researcher], [_Montreal, QC_], [Python, Flask, Go, React])
- Wrote a browser extension backend that parsed YouTube video transcripts around most-replayed segments to fact-check claims
- Integrated concurrent Go API clients into Python through CGo and ctypes, handling cross-language memory ownership
- Led prototype architecture and presented the research at McGill's undergraduate research symposium

== Projects
*Mini-C Compiler* | Compilers, Java, JUnit, MIPS32 #skip #link("https://stanleywang.dev/projects/mini-compiler")[#icon("link-16")]
- Wrote an end-to-end compiler in Java for a C subset, targeting MIPS32 assembly
- Frontend: lexer, Pratt parser, AST, scoped name resolution, and type checking
- Backend: MIPS32 codegen for expressions, control flow, memory access, and function calls with a stack-based calling convention
- Implemented graph-coloring register allocation with backward liveness analysis, optimistic allocation, and spill-code generation
- Extended the language with classes, single inheritance, and virtual dispatch; built a JUnit/MARS test harness

*Trading Fours* | Recommender System, Python, Flask, React, XGBoost, Redis, MySQL, Docker, AWS #skip #link("https://www.youtube.com/watch?v=sx5btkY24hQ")[#icon("link-16")] #link("https://github.com/stanley-910/trading-fours")[#icon("github")]
- Built a personalized Spotify recommender combining XGBoost genre predictions, listening history, and cosine-similarity ranking
- Deployed Flask and React containers to AWS EC2 through a GitHub Actions CI/CD pipeline pushing images to ECR
- Served the backend from preloaded Gunicorn workers sharing one model copy, with Redis session caching and MySQL pooling

*Pi Talk* | Agentic Tooling, TypeScript, Node.js, OpenAI TTS #skip #link("https://pi.dev/packages/@twinfantasyfan/pi-talk")[#icon("link-16")] #link("https://github.com/stanley-910/pi-talk")[#icon("github")]
// Published 2026-09-20 as @twinfantasyfan/pi-talk 0.1.0 (MIT); repository public.
- Published a text-to-speech extension for the Pi agent harness: streaming audio, pause/resume, live speed control
- Implemented Unicode-safe chunking, playback backpressure, timeouts, and cancellation when newer responses arrive

== Skills
*Languages*: Java, Python, TypeScript, JavaScript, Go, C, C++, Swift, OCaml, SQL, Lua, Bash \
*Technologies*: Linux, Git, Docker, AWS, GitHub Actions, Node.js, React, Flask, FastAPI, REST, Redis, PyTorch, scikit-learn, NGINX \


#pagebreak()

== Additional Projects

*OS Kernel Simulator* | Systems Programming, C, Make #skip
- Created an OS simulator in C that loads shell scripts and tracks execution with process control blocks
- Implemented process scheduling with round-robin time slicing and priority aging for waiting processes
- Simulated demand paging with per-process page tables and LRU page replacement


*Constrained Image Classification* | Machine Learning, PyTorch, Bash, SLURM #skip #link("https://stanleywang.dev/projects/odd-one-out")[#icon("link-16")]
- Developed CNN and feature-based odd-one-out image classifiers under a 25,000-parameter limit
- Built Bash/SLURM tooling to upload code, launch GPU training jobs, and retrieve results from a university cluster

*Chani* | Networking, OCaml, Lwt, TCP #skip #link("https://github.com/stanley-910/chani")[#icon("github")]
- Wrote an OCaml TCP command-line chat app supporting concurrent client connections and server-side message broadcasting
- Implemented independent send/receive loops so clients could receive messages while awaiting input

*Dictate* | On-Device AI, Swift, AppKit, macOS, transcribe.cpp, Metal #skip #link("https://github.com/stanley-910/dictate")[#icon("github")] 
- Built an offline macOS dictation app in Swift, replacing paid cloud dictation services like Superwhisper
- Implemented a global hotkey to record, on-device transcription with any local GGUF model, and pasting at the cursor
- Added transcript correction: a custom-word dictionary for misheard names plus configurable word or regex replacements

*Lovebox* | Raspberry Pi, JavaScript, Vite, Firebase, Python, Bash, systemd #skip #link("https://github.com/stanley-910/lovebox")[#icon("github")] 
- Built a Raspberry Pi touchscreen device, now in use for long-distance messaging, shared drawing, and Spotify playback
- Added touchscreen Wi-Fi setup and automated software updates with systemd, including rebuilds and selective service restarts