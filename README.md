# CatAPISwiftUIAPP

A simple, yet all-inclusive app for looking at affectionate cats, thanks for the courtesy of [The Cat API](https://thecatapi.com/).

Worked upon [networking tutorial](https://www.youtube.com/watch?v=ZHK5TwKwcE4&list=PLWHegwAgjOko-_H8MPHbPJbA24Gel2fg_&index=3) by Katrin Prater.

## Features
### Code-wise
* MVVM architecture
* separate network layer
* custom errors with custom descriptions for both user and debug
* iOS 15+ features
  * search bar `.searchable`
  * `AsyncImage`
* decoding nested JSON to custom data model
  * using `init(from: Decoder)` constructor for more flexibility

### User
* A scrollable, searchable list of cat breeds
  * with image
  * with breed's traits
* Details view for each breed
  * cat's picture
  * long description
  * affection level
  
## TODO

* Unit testing
 * dependency injection
 * mock API service
* Better UI
  * Responsive images
* Support from iOS < 15
