# Customer Service Chat in Rails 5 with ActionCable and Nexmo

A demo that implements a customer service two way chat between a web app and customers on mobile, using Rails 5's ActionCable and the [Nexmo Text Messages API](https://www.nexmo.com/products/sms/).

![Nexmo Customer Service App](docs/nexmo.gif)

## The chat UI

The [before](../../tree/before) branch holds the starting point of this tutorial and is a basic Rails 5 app that lets an admin respond to a message thread. All messages are seed data and no actual integration with Nexmo or ActionCable is in place.

### Usage

Please ensure Ruby 2.2.2 or higher is installed.

- Clone this repository
- Run `git checkout before`
- Run `bundle install`
- Run `rails db:create db:migrate db:seed`
- Run `bundle exec rails server`

Now open a browser to [localhost:3000](http://localhost:3000) and you will be presented with the bare basic UI.

## ActionCable and Nexmo communication


The [after](../../tree/after) branch is the end point of our tutorial, allowing you to have two way communication between a phone number and the web app.

The differences between these two branches can be seen [here](../../compare/before...after) and in our in-dept tutorial.

### Usage

Please ensure Ruby 2.2.2 or higher is installed.

- Clone this repository
- Run `git checkout before`
- Run `bundle install`
- Run `rails db:create db:migrate db:seed`
- Copy `.env.example` to `.env` and add your [Nexmo API key and secret](https://dashboard.nexmo.com/settings), and add a Nexmo phone number
- Run `bundle exec rails server`
- Visit <http://localhost:3000>

If you now text your Nexmo phone number you should be able to see the message come in on the Rails app within a few seconds.

### Incoming messages

To receive incoming messages make sure your local server is available publicly. An easy way to do this is to use [Ngrok](https://ngrok.com/).

Then set up your SMS webhook which is easy to do with the [nexmo-cli](https://github.com/nexmo/nexmo-cli).

```sh
nexmo link:sms 445555555555 http://<your_id>.ngrok.com/response
```
