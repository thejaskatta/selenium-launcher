= Selenium Connect Redux

== Punch List:

1. Local browser execution with browser drivers (for easier test authoring)
2. Remote execution (for a single node or a grid)

== Considerations:

+ HTML and XML output are ripe candidates for their own gem, so they will not live here.
+ Will need to sort out the best way to handle browser driver downloads per OS. Will likely start by letting the user do the work and automate it later (in a separate gem).
+ Cloud execution will need to be added later, but that has additional considerations. So that will be deferred for now.
+ Mobile is also a consideration. Again, one to defer for now.
