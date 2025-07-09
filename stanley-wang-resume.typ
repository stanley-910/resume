#set page(paper: "us-letter", margin: (x: 0.75cm, y: 0.75cm))
#set text(size: 11pt, font: "Charter")
#set line(length: 100%, stroke: 0.25mm)
#set par(leading: 0.4em, justify: true)
#show heading.where(level: 2): it => {
  it; v(-0.8em); line(); v(-0.2em)
}
#let header(name, ..params) = align(center)[
  #text(size: 1.7em, weight: "semibold")[
    #name.split().join(h(0.3em))
  ] \
  #params.pos().join(" | ") #v(-1em)
]
#let skip = h(1fr) // For the horizontal spacing between title and date

#show link: it => underline(text(fill: blue)[#it])

#header(
  // Make links regular if printed
  "Stanley Wang",
  "stanley.wang.cs@gmail.com",
  link("https://github.com/stanley-910")[GitHub],
  link("https://www.linkedin.com/in/notstanleywang/")[LinkedIn],
  link("https://stanleywang.dev")[Portfolio]
)

== Skills
*Languages*: Python, TypeScript, Java, Go, JavaScript, MySQL, OCaml, C++, C, Lua, Bash \
*Technologies*: Git, Unix, React, Flask, REST APIs, WebSocket, Redis, pandas, scikit-learn \
*Cloud & DevOps*: AWS, Docker, CI/CD, Load Balancing, NGINX


== Experience
*Software Engineering Intern*, *Autodesk*, Montreal, QC #skip May 2025 -- Aug 2025
- Contributing to *Flow Production Tracking* and *Creative Review's* public beta release
- Enhancing *UI/UX* and *performance* of features used by major studios (*Disney*, *Sony*, *MAPPA*, etc.)
- Improving deployment reliability through *test-driven development* and *CI/CD pipeline* creation
- Building *visual debugging tool* with *user event sequence tracing*

*Software Engineering Intern*, *BETA Technologies*, Montreal, QC #skip Jan 2025 -- Apr 2025 \
#link("https://stanleywang.dev/experience/beta-case-study")[Read Case Study]
- Developed structural analysis library in *Python*, reducing *3-day* manual process to *10 seconds*
- Engineered a batch-processor to efficiently modify *multi-gigabyte* finite element aircraft models
- Implemented *undo system* for *shared-state* aircraft, enabling *complex operation chaining* without re-parsing 
- Accelerated future development of structural analysis tools by *95%*

*Lead Researcher*, *McGill AI Ethics Lab*, Montreal, QC #skip May 2024 -- Present
- Researched and presented novel misinformation solutions at *McGill's Undergraduate Research Symposium*
- Built *cross-language API* library in *Go* with *C bindings* for *Python* integration, improving team velocity by *40%*
- Developed *NLP-powered* video analyzer using *sentiment analysis* and *engagement pattern* detection

== Projects
*Trading Fours*, Full Stack & Machine Learning #skip #link("https://www.youtube.com/watch?v=sx5btkY24hQ")[Demo Video] | #link("https://github.com/stanley-910/trading-fours")[GitHub]
- Developed a music recommendation engine using *XGBoost* and *gradient boosting* for genre prediction
- Deployed on *AWS EC2* with *Docker* containers, *CI/CD pipeline*, and *NGINX* reverse proxy
- Optimized data-transfer speeds by *30%* through *SQL pooling* and *Redis caching*
- Reduced server memory usage by *50%* by sharing *machine-learning model state* between workers

*McGill Formula Electric Battery Monitor*, Embedded Systems #skip #link("https://github.com/stanley-910/chani")[GitHub]
- Designed monitoring system integrating *CAN bus* data through *MCP2515* to *Raspberry Pi* via *SPI protocol*
- Built *real-time* dashboard in *Python* for battery monitoring with *heat safety* alerts

*Terminal Chatroom*, Networking & Functional Programming #skip #link("https://github.com/stanley-910/chani")[GitHub]
- Built *OCaml* chat server with *concurrent* client handling using *TCP sockets* and *async I/O*
- Implemented custom *application-layer protocol* with *packet framing* for reliable messaging

*Datamines*, Game Development #skip #link("https://averageosiris.itch.io/datamines")[Play Game] | #link("https://github.com/CRook99/DATAMINES")[GitHub]
- Created atmospheric *2D platformer* in *Unity* for McGill CodeJam
- Wrote an *adaptive soundtrack* system using *linear interpolation* for dynamic music transitions

*Obsidian Notetaking Plugin*, Open-Source #skip #link("https://github.com/stanley-910/obsidian-code-language-completer")[GitHub]
- Developed *TypeScript* plugin for Obsidian with *1,000+* downloads, enhancing developer workflows 


== Education
*McGill University, Bachelor of Computer Science* #skip Sep 2022 -- Dec 2027