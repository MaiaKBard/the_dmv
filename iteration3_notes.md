Create Facility objects from Multiple Data Sources:

 - Need to create DMVFacility objects from MULTIPLE data sources
    i.e Colorado, New York, Missouri
...but keeping the same FacilityFactory class?


- Right now  my FacilityFactory class has fixed data structure -  is data that is not, under normal circumstances, subject to change.
    - I need to find the opposite of fixed data structure

--> a data structure that will extract the data with a provided data set aka differnt dmvs in differnt states

- It will need to pass through the DMVFacility class for each state

I found Lambdas? Not sure if I quiet understand them but I want to try to use it...

Test needed to use this -->

1. Handles Colorado Data - Given a Colorado dataset it correctly maps and creates facilities

2. Handles New York Data - Given a New York dataset it correctly maps and creates facilities

3. Handles Missouri Data - Given a Missouri dataset it correctly maps and creates facilities

4. Handles Empty Data - if an empty dataset is is given it should return an empty array

5. Handles Missing Feilds - if feilds given are not met it should not break the application and still spit back what feilds are met

How do I define lambda? used chagpt for this part

Mappers...
 --> is a function, object, or module that transforms data from one structure or format to another

    -Mappers are often used to convert raw data into a more usable or domain-specific format.

Ok good cause our data input is in an array/hash format... i think

I wan to use a lambda as a mapper

- Id need to define a variable in my code set to a hash using the word lambdas or -> 

- Ill have to create a mapper for each state that includes a hash

I would still need a facility object... but i would think because we have mulitple facilities now id need to define one for each?
- i should include the mappers in its correlating facility i would guess to make it easier for the FacilityFactory class to process and allows for more flexiblity in the future when adding more dmvs

I need to keep it 'exsists' test

1. I need to describe the colorado dmv
    - i need it to create DMV facility objects from the CO DMV data given 

    - and also asign the attributes correctly when ran 

2. I need to repeat the same process for each DMV to make sure they all function correctly


