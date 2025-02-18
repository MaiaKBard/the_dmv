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

3. Handles Missing Feilds - if feilds given are not met it should not break the application and still spit back what feilds are met

--> I need to create a test that will return an empty aray if a data set it not given in my method .create_facilities()

--> I need to create a test that will allow the system to still function when not all the feilds within the hash are given within the data set 

I will need to rewrite the input in the attribute spaces so if the data is not given it will output nil or nothing or string possibly

--> to test this i should define a line of incomplet data given
--> call that imcomplete data within the .create_facilities(incomplete_data, @mo_mapper)
    -it needs to process this input and output facility objects still

--> now I would need to make sure the mapper will still set the feilds correclty even when given incomplete data
    -write expect statements for each attribute feild


