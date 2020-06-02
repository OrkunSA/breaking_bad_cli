* class Api
  * will handle API GET requests
  * initial request will get a list of character and then iterate of that list,
  *calling Character.new to instantiate character objects
  * subsequent requests will be passed on character id to be used to make another GET request for detailed info.
  * detailed info will be passed on character object to update itself

  * class Character
    *create and save character objects
    *character objs will be instantiated with name and id and saved to @@all
    * additional attr_accessors for additional details to be updated when selected

  * class Cli
    * handle all input and output
    * first call the api class to fetch all character
    * list character
    * prompt user for a selection
    * pass user select to api for details requests
    * display updated character details
    * prompt user to continue or exit

    
