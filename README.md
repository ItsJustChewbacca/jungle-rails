# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product
!['Screenshot of Homepage'](https://github.com/ItsJustChewbacca/jungle-rails/blob/master/pictures/home_page.png)
!['Screenshot of admin's ability to create categories](https://github.com/ItsJustChewbacca/jungle-rails/blob/master/pictures/categories.png)
!['Screenshot of admin's ability to create products](https://github.com/ItsJustChewbacca/jungle-rails/blob/master/pictures/create_a_product.png)
!['Screenshot of a user's cart after adding products](https://github.com/ItsJustChewbacca/jungle-rails/blob/master/pictures/cart.png)
!['Screenshot of order page'](https://github.com/ItsJustChewbacca/jungle-rails/blob/master/pictures/thank_you_for_your_order.png)
!['Screenshot of order page with details expanded'](https://github.com/ItsJustChewbacca/jungle-rails/blob/master/pictures/Order_has_been_placed.png)
!['Screenshot of product with reviews and review form'](https://github.com/ItsJustChewbacca/jungle-rails/blob/master/pictures/Write_a_review.png)
## Setup
```
1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
```
## Stripe Testing
```
Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
```
More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies
```
* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
```