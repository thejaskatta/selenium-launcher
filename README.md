= Selenium Connect Redux

== Punch List:

1. Local browser execution with browser drivers (for easier test authoring)
2. Simple HTML reporting with failure screenshots
3. JUnit XML output for CI integration
4. Remote execution (for a single node or a grid)

== Considerations:

+ The HTML and XML output are ripe candidates for their own gem. But that's a problem for later.
+ Will need to sort out the best way to handle browser driver downloads per OS. Simplest thing to start is to let the user do the work. Could automate this later.
