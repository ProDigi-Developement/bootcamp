# Step 2

### Problem / Requirement 
Each animal should have their base food.
### Goal
An easy way to control this change is create an enum with all possibilities food for our scenario and then update the protocol. Then we will need to update each model according to the changed protocol.

#### Steps:
- On protocol file:
  - Create an enum called AnimalFoods with the values: `meat, plants, eggs and milk`
  - Add a new property called `baseFood` with type `AnimalFoods`
- Update each model according to the changes on the protocol
- Update the main class to print the new property
