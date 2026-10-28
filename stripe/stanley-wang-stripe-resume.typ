// WORKING DRAFT — inherited claims and final selection are not yet verified.
#set page(paper: "us-letter", margin: (x: 0.81cm, y: 0.3cm))
#set text(size: 10pt, font: "Charter")
#set line(length: 100%, stroke: 0.25mm)
#set par(leading: 0.30em, justify: true)
// sticky block keeps heading + rule together; a trailing v() here breaks page fitting
#show heading.where(level: 2): it => block(sticky: true, above: 1.0em, below: 0.6em)[#it #v(-0.8em) #line()]
#let header(name, ..params) = align(center)[
  #text(size: 1.95em, weight: "semibold")[
    #name.split().join(h(0.3em))
  ] \ #v(-0.1em)
  #set par(justify: false)
  #text(font: "Berkeley Mono Prose", size: 8.5pt)[#params.pos().join(h(1.2em))] #v(-0.6em)
]
#set list(indent: 0.4em)
#let hlink(url, body) = link(url, box(body))
#let skip = h(1fr) // For the horizontal spacing between title and date
// Experience entry: company + date on the scan line, role + location under it
#let entry(company, date, role, loc, stack: none, team: none) = [
  *#company*#if team != none [ | #team] #skip #date \
  #emph(role)#if stack != none [ -- #stack] #skip #loc
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


== Experience
#entry([Electronic Arts], [May 2026 -- Aug 2026], [Software Engineering Intern], [_Redwood City, CA_], team: [Commerce & Identity])
- Prototyped a personalized Madden Mobile shopping assistant, projecting \$157K in annual revenue lift
- Built and presented a business case from commerce data and studies, securing approval to advance toward production
- Built reusable agentic commerce components and integration interfaces for expansion across EA's games and web stores
- Protected users from duplicate-charge risk through idempotent checkout retries and server-verified purchase recording
- Deployed an issue-to-review agent orchestration project used by teammates on a shared server with per-user Docker workspaces

#entry([Autodesk], [May 2025 -- Aug 2025], [Software Engineering Intern], [_Montreal, QC_], team: [Media & Entertainment])
- Built a diagnostic pipeline combining playback, drawing, and rendering data to debug collaborative film-review sessions
- Built a visual debugger aligning host and participant recordings to pinpoint playback, annotation, and rendering mismatches
- Resolved a production outage for two large studios within an afternoon by correcting feature-gating logic in the login flow  

#entry([BETA Technologies], [Jan 2025 -- Apr 2025], [Software Engineering Intern], [_Montreal, QC_], team: [Stress & Structures])
- Automated NASTRAN aircraft model preprocessing in Python, reducing a three-day manual workflow to under 10 seconds
- Developed a reusable Python library for NASTRAN model transformations: DMIG prep, numerical buckling, coordinate symmetry
- Implemented checkpoint-based rollback to generate model variants from shared state without re-parsing or copying

#entry([McGill University], [May 2024 -- Dec 2024], [Lead Researcher, supervised by Prof. Joseph Vybihal], [_Montreal, QC_], team: [AI Ethics Research Lab])
- Wrote a browser extension backend that parsed YouTube video transcripts around most-replayed segments to fact-check claims
- Integrated concurrent Go API clients into Python through CGo and ctypes, handling cross-language memory ownership
- Led prototype architecture and presented the research at McGill's undergraduate research symposium

== Education
*McGill University*, B.Sc. in Computer Science #skip Sep 2022 -- Dec 2026

== Skills
*Languages*: Java, Python, TypeScript, JavaScript, Go, C, C++, Swift, OCaml, SQL, Lua, Bash \
*Technologies*: Linux, Git, Docker, AWS, GitHub Actions, Node.js, React, Flask, FastAPI, REST, Redis, PyTorch, scikit-learn, NGINX \


== Projects
*Mini-C Compiler* | Java, MIPS32, JUnit #skip #link("https://stanleywang.dev/projects/mini-compiler")[#icon("link-16")]
- Built a Java compiler for a C subset with Pratt parsing, scoped name resolution, type checking, and MIPS32 code generation
- Implemented graph-coloring register allocation with backward liveness analysis, optimistic allocation, and spill-code generation
- Extended the language with classes, single inheritance, and virtual dispatch; built a JUnit/MARS test harness
*Operating Systems Projects* | C, pthreads #skip
- Built an OS simulator in C with process control blocks, round-robin scheduling, and priority aging
- Simulated demand paging with per-process page tables and LRU page replacement
- Implemented concurrent work dispatch with a producer-consumer queue, using mutexes and semaphores for synchronization


*Trading Fours* | Python, React, XGBoost, AWS #skip #link("https://www.youtube.com/watch?v=sx5btkY24hQ")[#icon("link-16")] #link("https://github.com/stanley-910/trading-fours")[#icon("github")]
- Trained an XGBoost genre classifier and combined predictions with Spotify listening history for personalized recommendations
- Deployed containerized Flask and React services to AWS EC2 through GitHub Actions and ECR
- Optimized EC2 memory overhead by sharing model data across workers; added Redis caching and MySQL connection pooling

*Portal* | TypeScript, Next.js, WebGL2, Liveblocks, Stripe #skip #link("https://portal-swart-mu.vercel.app")[#icon("link-16")] #link("https://github.com/stanley-910/portal")[#icon("github")]
// Hackathon project, Fall 2026, team of four. Stanley wrote the globe, multiplayer, agent harness and booking code, and co-wrote transport search.
- Built a multiplayer 3D globe where friends plan trips together live, from plotting routes to booking flights
- Developed an agentic commerce harness that serves the whole group, optimizing routes to a budget and booking on request
- Implemented all-or-nothing group booking with Stripe card holds, buying tickets only once every rider has paid
