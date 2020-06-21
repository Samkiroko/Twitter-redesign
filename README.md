# Twitter Redesign

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

 Capstone Project of the Ruby on Rails Curriculum in Microverse.

 The project consisted of creating an MVP of the app. With the implementation of the main functionalities.

 - Users log in only with username (proper authentication was not a requirement)
   - Before a user logs in they can only see the Log in/Sign up page
   - When they log in they have full access to the app
 - Users can create opinions/tweets
 - Users can follow other users
 - Users can add a profile photo and a profile cover image
   - They can upload the images while signing up 
   - Or, later on through the settings page
 - The discover page shows the most recent opinions/tweets from users that are not followed by the logged in user

 - The app is an MVP of the full product - with the full graphical design, but only basic features that can be extended in the future.


 The Live Version - [Twitter Redesign](https://sam-twitter-capstone.herokuapp.com/)

 Design: [Twitter Redesign](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details), by [Gregoire Vella](https://www.behance.net/gregoirevella)

 ## Home page
 ![image](https://user-images.githubusercontent.com/43377799/85222289-a9adfa00-b3c2-11ea-80f9-07983cb7511b.png)


 ## Profile page
 ![image](https://user-images.githubusercontent.com/43377799/85222239-44f29f80-b3c2-11ea-96a5-2444d6c501d5.png)
## Built With

- Ruby (version 2.6.5)
- Ruby on Rails (version 5.2.4)

- Gems
  - gem 'pg'
  - gem 'bootstrap-sass'
  - gem 'font-awesome-rails'
  - gem 'rspec'
  - gem 'capybara'
  - gem 'carrierwave'
  - gem 'faker'


## Usage

Clone the repository to your machine and cd into the directory

````
$ git clone git@github.com:Samkiroko/Twitter-redesign.git
$ cd Twitter-redesign
````
Use the following command to start the rails server then visit: http://localhost:3000 to use the app
````
$ rails s
````
Run RSpec tests

````
$ rspec
````

## Authors

👤 **Samuel kiroko N**

- Twitter: [@kirokonjenga](https://twitter.com/kirokonjenga)
- LinkedIn: [@samuel-kiroko](https://www.linkedin.com/in/samuel-kiroko/)
- Personal Website: [kiroko.tech](https://www.kiroko.tech/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Samkiroko/Twitter-redesign/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/)
- [Gregoire Vella](https://www.behance.net/gregoirevella)



[contributors-shield]: https://img.shields.io/github/contributors/Samkiroko/Twitter-redesign.svg?style=flat-square
[contributors-url]: https://github.com/Samkiroko/Twitter-redesign/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Samkiroko/Twitter-redesign.svg?style=flat-square
[forks-url]: https://github.com/Samkiroko/Twitter-redesign/network/members
[stars-shield]: https://img.shields.io/github/stars/Samkiroko/Twitter-redesign.svg?style=flat-square
[stars-url]: https://github.com/Samkiroko/Twitter-redesign/stargazers
[issues-shield]: https://img.shields.io/github/issues/Samkiroko/Twitter-redesign.svg?style=flat-square
[issues-url]: https://github.com/Samkiroko/Twitter-redesign/issues
