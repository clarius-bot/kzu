---
layout: post
title: Guidance Automation in the development process
date: 2006-02-01 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/GuidanceProcess
tags:
- .NET
- All Technology
- GAT

---

## Guidance Automation in the development process

What follows are some thoughts regarding the authoring of guidance that we have learned during practical experience. The following applies to bothDSLandGAXtoolkits.

Developing guidance should be an iterative process, and we're still exploring it and how it fits in the overall development process. Intuitively and based on previous experience building several guidance packages, I'd say the process is more or less as follows:

### Phase 1: Define End Product

1. Use intensive TDD and short iteration cycles to develop the end "product" you'd like to guidance-enable (i.e. code, application structure and architecture, etc.)2. During 1), you will end up with a process that takes you from a scenario/use case to an implementation using the architecture/structure you designed (ideally via TDD)

### Phase 2: Define Guidance Process and Flow

3. From that process, figure out which are the variability points, where the user should be involved in decisions that affect what the code/solution looks like, as well as the dependencies between them (user does A and only then can do B)4. Understand and clarify the roles, personas, concerns and use cases the guidance should express5. Based on the previous two findings, define the launch points for those user interactions (recipe/template/dsl launching points)6. Mock-up the recipes and UI required for the entire package, and document the steps and input required for each7. Analyze the mocks, go through them, and evaluate whether the input information, the process flow, and the launch points follow a natural progression that is likely to be intuitive enough for users. Also, think of potential missing pieces of input that may be needed to get to the end result from there

### Phase 3: Implement Guidance

8. Finally, add the actions to the recipes so that they generate the code

9. Test the generated code and the whole process. Once this is OK (or if you have spare time in the meantime), do the next step.10. Improve the UI by adding type converters and UI editors

Unless you do Phase 1, the optional 8.a step becomes more important, but I think it is far worse as a testing approach, and will never be as comprehensive as a well done Phase 1.Phase 1 and 3 are the most likely to consume the most time. I believe in the majority of cases (unless you already know very well you want the guidance to do up-front, or the scope well defined and not too big), the former will be longer than the latter. However, depending on the nature of the tooling part, and the complexity/lack of documentation/unforeseen bugs-issues with VS/integration with Beta-quality products/etc., Phase 3 may become a big part of the work too (we faced this a number of times, where something was supposed to take a few hours and we ended up spending at least a couple days chasing a bug or erratic behavior in VS). Any kind of integration with VS is bound to be unpredictable to a certain extent in that front for the foreseeable future, I'm afraid :(

What raises considerable the bar for phase 3 is if you introduce a meta-guidance in the picture (i.e. you want a guidance package to help people build guidance packages in a certain area).

posted on Wednesday, February 01, 2006 10:25 AM
						bykzu

/kzu
