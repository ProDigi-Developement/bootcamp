# Step 4

### Problem
The actual main class is getting to much code duplication.
### Goal
Use OOP to solve the problem. Changing the protocol to force the model to implement a new function called toString that will return a String with the object values to be printed.

#### Steps:
- On the protocol class:
  - Add a new function called toString that will return a String value.
- Update each model according to the protocol.
- Update the main class to use the new model function instead of the actual print.
