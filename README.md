# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)


# 📖 Nice Car Renta Application <a name="about-project"></a>

> Nice Car Rentals Application contains the backend code for a Car Rental App, which allows users to reserve a car, add new cars, and delete existing ones. The backend is built using Ruby On Rails and communicates with the frontend of the app to provide a seamless user experience. The backend includes functionality for user authentication and authorization, allowing only authorized users to perform actions such as adding or deleting cars. It also includes a Postgresql database to store information about the cars available for rental, as well as information about user reservations.


## 🛠 Built With <a name="built-with"></a>

- [Rails](https://rubyonrails.org/)

- [Postgresql](https://www.postgresql.org/)


### Key Features <a name="key-features"></a>

- See various car models
- Reserve cars
- Add cars
- Delete cars

### Front End App

Click [here](https://github.com/otmanTR/nice-car-front-and) to acess the frontend app that was built with react.

### API Documentation

- Check [swagger documentation](https://car-rental-j96f.onrender.com/api-docs/index.html)

### Kanban Board

- [Link to kanban board](https://github.com/otmanTR/nice-car-back-and/projects/2)

- Our team consist of 4 members:
 [@burakotman](https://github.com/otmanTR)
 [@jodavid444]((https://github.com/jodavid444))
 [@alicemirigo]((https://github.com/alicemirigo92))
 [@becky](https://github.com/Becky449)

### Intial state 👇

<img src="/images/initial state.jpg" alt="initial-state-img">

### After 1 week iteration 👇

<img src="/images/week 1 iteration.jpg" alt="one-week-iteration-img">

### The Second Week of iteration 👇

<img src="/images/week 2 iteration.jpg" alt="two-week-iteration-img">

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Install [ruby](https://www.ruby-lang.org/en/) on your computer or run it with docker.

- Install [Rails](https://rubyonrails.org/)

- Install [Postgresql](https://www.postgresql.org/)

### Setup

- First Clone this repository to your desired folder by using the command line:

run this commands:

```sh
git clone https://github.com/otmanTR/nice-car-back-and

```

- Open a `.env.example` file at root directory and fill parameters accordingly.

- Example:

``` sh
RAILS_DATABASE_USER=user
  RAILS_DATABASE_PASSWORD=12345678
```

- Rename the file to `.env`

### Install
- Install all the gems with the following command:

```sh
bundle install
```

### Usage
- To run this project follow the next steps:

- Create  database with the following command:

```sh
rails db:create

```
- Apply migrations with the following command

```sh
rails db:migrate

```
- [Optional] Run the following command to fill the database with data:

```sh
rails db:seed

```
- Rub the app by executing:


```sh
rails s --port=1800

```

### Run Tests 

To run test execute the following command:

```sh
rspec spec --exclude-pattern "spec/requests/swagger/**/*_spec.rb"
```
### Deployment

- You can deploy this project on [render](https://render.com/):

- Follow the steps in this [documentaion] (https://render.com/) to deploy a rails app.


## Authors <a name="authors"></a>

👤 **Joseph David**

- GitHub: [@jodavid444](https://github.com/jodavid444)

- Twitter: [@jodavid444dave](https://twitter.com/jodavid444dave)

- LinkedIn: [@joseph-david](https://www.linkedin.com/in/joseph-david-/)

👤 **Recep Burak Otman**

- GitHub: [@otmanTR](https://github.com/otmanTR)

- Twitter: [@hotumanzade](https://twitter.com/hotumanzade)

- LinkedIn: [@burakotman](https://www.linkedin.com/in/joseph-david-/)

👤 **Alice Mirigo**

- GitHub: [@alicemirigo92](https://github.com/alicemirigo92)

- Twitter: [@GathoniMirigo](https://twitter.com/GathoniMirigo)

- LinkedIn: [@alicemirig](https://www.linkedin.com/in/alice-mirigo/)

👤 **Rebbeca Nabwire**

- GitHub: [@Becky449](https://github.com/Becky449)

- LinkedIn: [@rebbeca nabwire](https://www.linkedin.com/in/rabeccanabwire/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Add raing system]**
- [ ] **[Update car details]**
- [ ] **[Filter user by their role]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please leave a star. Thank you 🙏

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- I would like to thank Microverse for the great project idea.
- Unsplash for providing content related free pictures.

- Thanks to my teammates, learning and coding partners.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
